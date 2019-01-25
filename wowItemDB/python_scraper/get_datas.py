#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re
import sys
import os
import json

expansion_dic = {
	7 : 'Battle For Azeroth',
	6 : 'Legion',
	5 : 'Warlords Of Draenor',
	4 : 'Mists Of Pandaria',
	3 : 'Cataclysm',
	2 : 'Wrath Of The Lich King',
	1 : 'The Burning Crusade',
	0 : 'Classic'
}

territory_dic = {
	1 : 'Alliance',
	2 : 'Horde',
	0 : 'War Zone'
}

category_dic = {
	3 : 'Raid',
	2 : 'Dungeon',
	15 : 'Outdoor Zone'
}

########################################################
#fonction qui récupère la donnée json dans la page HTML#
#3 types de regex possibles :                          #
#  - classification.*location.*name.*count.*outof\:\d+ #
#  - \"boss\"\:\d+.*name.*count.*outof\:\d+            #
########################################################

def find_json_data_in_file(page):
	data = re.search('\"boss\"\:\d+[\s\'\,\"\\\/classificationlocation\d+id\:\[\]maxlevel\w\-\-\_]+', page)
	if data:
		json_str = data.group(0)
		return json_str
	else:
		data = re.findall('\{\"classification\"\:\d+[\s\,\"\\\/location\d+id\:\[\]maxlevel\w\-\'\-\_]+', page)
		if data:
			json_str = data[-1]
			return json_str
		else:
			data = re.findall('azerazer', page)
			if data:
				json_str = data[-1]
				return json_str
			else:
				return -1

###########################################################
# Fonction qui va récuperer l'expansion, le territoire,   #
# la categorie de localisation et son nom                 #
#	en remplissant l'objet data_object                    #
###########################################################

def get_location(locate_id, location_json, object_dic):
	locate_str = ""
	for keys in location_json:
		if (int(keys["id"]) == int(locate_id)):
			if (keys.get("expansion") != None) and keys["expansion"] in expansion_dic:
				object_dic['expansion'] = expansion_dic[keys["expansion"]]
			if (keys.get("territory") != None) and keys["territory"] in territory_dic:
				object_dic['territory'] = territory_dic[keys["territory"]]
			if (keys.get("category") != None) and keys["category"] in category_dic:
				object_dic['category_territory'] = category_dic[keys["category"]]
			object_dic['location'] = keys["name"]
			return object_dic

###########################################################
#			calculate the loot rate of an itaem			  #
#			Thanks to the count number of wowhead         #
###########################################################

def calculate_loot_rate(loot_rate):
	value_tab = loot_rate.split(":")
	value1 = value_tab[0]
	value2 = value_tab[1]
	if (value1 == 0 or value2 == 0):
		loot_rate = 0
		return loot_rate
	else:
		loot_rate = (int(value1) / int(value2)) * 100
		loot_rate = round(loot_rate, 2)
		return loot_rate

#####################################################################
#fonction qui boucle sur le fichier d'url pour récuperer les données#
# et les remplir dans un objet. Nous utiliserons alors cet objet    #
# pour écrire dans le fichier servant de base de donnée LUA         #
#####################################################################

def loop_over_files(location_json):
	#print (location_json)
	for files in os.listdir("../links"):
		filename = "../links/" + files
		with open(filename) as f:
			content = f.read().splitlines()
			for item in content:
				object_dic = {
					'name' : '',
					'location' : '',
					'source' : '',
					'territory' : '',
					'category_territory' : '',
					'expansion' : '',
					'drop_rate' : ''
				}
				page_response = requests.get("https://www.wowhead.com/item=159097/paku-blessed-greatbow", timeout=10)
				page_content = BeautifulSoup(page_response.content, "html.parser")
				print (page_content)
				name = page_content.find("h1", {"class" : "heading-size-1"}).getText()
				object_dic['name'] = name
				json_string = find_json_data_in_file(page_content.prettify())
				if (json_string == -1):
					print("No source found for " + object_dic['name'])
					continue
				else:
					#print (json_string)
					locate_id = re.search('location\"\:\[[\d\,]+\]', json_string)
					if (locate_id):
						locate_id = ((locate_id.group(0)).replace('location":[', '')).replace(']', '')
						if (locate_id.find(",") != -1):
							locate_id = locate_id[0:locate_id.find(',')]
					object_dic = get_location(locate_id, location_json, object_dic)
					source_name = re.search('name\"\:\"[\\\/\w\,\s\'\-\_]+\"', json_string)
					source_name = ((((source_name.group(0)).replace('name', '')).replace('\'', '')).replace('":"', '')).replace('"', '')
					object_dic['source'] = source_name
					loot_rate = re.search('count\:\d+\,outof\:\d+', json_string)
					if (loot_rate):
						loot_rate = ((loot_rate.group(0)).replace('count:', '')).replace(',outof', '')
					else:
						loot_rate = 'Unknown'
					loot_rate = calculate_loot_rate(loot_rate)
					object_dic["drop_rate"] = loot_rate
					print (object_dic)

####################################################################################
#  Fonction qui va créer le tableau de localisation basé sur la BDD wowhead        #
#  Et en faire un objet JSON que nous utiliserons pour récupérer le nom de la zone #
#  Le type de territoire ainsi que l'expansion de sortie                           #
####################################################################################

def create_location_tab():
	locations = {}
	page_response = requests.get("https://www.wowhead.com/zones")
	page_content = BeautifulSoup(page_response.content, "html.parser")
	strcontent = str(page_content.prettify())
	begin_cut = strcontent.find(";zonedata.zones = [{")
	end_cut = strcontent.find("zonedata.zones});")
	locatestring = strcontent[begin_cut:end_cut]
	locatestring = locatestring[18:(locatestring.find("new Listview") - 2)]
	return json.loads(locatestring)

def main():
	location_json = create_location_tab()
	loop_over_files(location_json)

main()