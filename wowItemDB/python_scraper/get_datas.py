#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from bs4 import BeautifulSoup
import requests
import re
import sys
import time
import os
import signal
import json
import progressbar

from progressbar import AnimatedMarker, Bar, BouncingBar, Counter, ETA, \
    AdaptiveETA, FileTransferSpeed, FormatLabel, Percentage, \
    ProgressBar, ReverseBar, RotatingMarker, \
    SimpleProgress, Timer, UnknownLength

widgets = [SimpleProgress(),
              Bar(marker='#',left='[',right=']'),
               ' ', ETA(), ' ', FileTransferSpeed()]

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

#######################################################################
#fonction qui recupere la donnee json dans la page html 			  #
#3 types de regex possibles :                          				  #
#  - classification.*location.*name.*count.*outof\:\d+ 				  #
#  - \"boss\"\:\d+.*name.*count.*outof\:\d+            				  #
#  - \'quest\'.*data\:.*category.*\"money\"\:\d+\,\"name.*\"xp\"\:\d+ #
#######################################################################

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
			data = re.findall('\'quest\'.*data\:.*category.*\"money\"\:\d+\,\"name.*\"xp\"\:\d+', page)
			if data:
				json_str = data[-1]
				return json_str
			else:
				return -1

###########################################################
# Fonction qui va recuperer l'expansion, le territoire,   #
# la categorie de localisation et son nom                 #
#	en remplissant l'objet data_object                    #
###########################################################

def get_location(locate_id, location_json, object_dic):
	locate_str = ""
	if not locate_id:
		return object_dic
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
	if (int(value1) == 0 or int(value2) == 0):
		loot_rate = 0
		return loot_rate
	else:
		loot_rate = (int(value1) / int(value2)) * 100
		loot_rate = round(loot_rate, 2)
		return loot_rate

def write_into_file(db_file, object_dic):
	db_file.write("\tid" + str(object_dic['id']) + " = {\n")
	lastkey = list(object_dic.keys())[-1]
	for keys, value in object_dic.items():
		if (keys == lastkey):
			db_file.write("\t\t" + keys + " = " + '"' + str(value).replace('\\', '').replace('"', "") + '"\n')
		else:
			db_file.write("\t\t" + keys + " = " + '"' + str(value).replace('\\', '').replace('"', "") + '",\n')
	db_file.write("\t},\n")

#####################################################################
#fonction qui boucle sur le fichier d'url pour recuperer les donnees#
# et les remplir dans un objet. Nous utiliserons alors cet objet    #
# pour ecrire dans le fichier servant de base de donnee LUA         #
#####################################################################

def loop_over_files(location_json):
	#print (location_json)
	for files in os.listdir("../links"):
		db_file_name = files.replace("_url.txt", "_db.lua")
		db_file = open("../DB/" + db_file_name, "w")
		db_file.write(files.replace(".txt", "_db").replace("-", "_") + " = {\n")
		filename = "../links/" + files
		print("ENTERING " + db_file_name)
		with open(filename) as f:
			content = f.read().splitlines()
			number = 0
			for item in progressbar.progressbar(content, widgets = widgets):
				object_dic = {
					'name' : '',
					'location' : '',
					'source' : '',
					'territory' : '',
					'category_territory' : '',
					'expansion' : '',
					'drop_rate' : '',
					'id' : number
				}
				loot_rate = ''
				try:
					page_response = requests.get(item, timeout=10)
				except KeyboardInterrupt:
					print ("Exiting")
					exit(0)
				except requests.exceptions.Timeout:
					print("Timed out URLS")
					continue

				page_content = BeautifulSoup(page_response.content, "html.parser")
				name = page_content.find("h1", {"class" : "heading-size-1"})
				if not name:
					continue
				else:
					name = name.getText()
				object_dic['name'] = name
				json_string = find_json_data_in_file(page_content.prettify())
				if (json_string == -1):
					#print("No source found for " + object_dic['name'])
					continue
				else:
					locate_id = re.search('location\"\:\[[\d\,]+\]', json_string)
					if (locate_id):
						locate_id = ((locate_id.group(0)).replace('location":[', '')).replace(']', '')
						if (locate_id.find(",") != -1):
							locate_id = locate_id[0:locate_id.find(',')]
					else:
						locate_id = re.search('category\"\:\d+', json_string)
						if (locate_id):
							locate_id = ((locate_id.group(0)).replace('category":', ''))
							loot_rate = 'quest'
						else:
							continue
					object_dic = get_location(locate_id, location_json, object_dic)
					source_name = re.search('name\"\:\"[\\\/\w\,\s\'\-\_\!\?\:]+\"', json_string)
					if (source_name):
						source_name = ((((source_name.group(0)).replace('name', '')).replace('\'', '')).replace('":"', '')).replace('"', '')
						if (source_name is not None):
							try:
								object_dic['source'] = str(source_name)
							except:
								continue
					else:
						#print (json_string)
						continue
					if not loot_rate:
						loot_rate = re.search('count\:\d+\,outof\:\d+', json_string)
						if (loot_rate):
							loot_rate = ((loot_rate.group(0)).replace('count:', '')).replace(',outof', '')
							loot_rate = calculate_loot_rate(loot_rate)
						else:
							loot_rate = 'Unknown'
					object_dic["drop_rate"] = loot_rate
					write_into_file(db_file, object_dic)
					number = number + 1
			db_file.write('\tend = "true"\n}')

####################################################################################
#  Fonction qui va creer le tableau de localisation base sur la BDD wowhead        #
#  Et en faire un objet JSON que nous utiliserons pour recuperer le nom de la zone #
#  Le type de territoire ainsi que l'expansion de sortie                           #
####################################################################################

def create_location_tab():
	locations = {}
	page_response = requests.get("https://www.wowhead.com/zones")
	page_content = BeautifulSoup(page_response.content, "html.parser")
	strcontent = page_content.prettify()
	begin_cut = strcontent.find(";zonedata.zones = [{")
	end_cut = strcontent.find("zonedata.zones});")
	if (begin_cut != -1 and end_cut != -1):
		locatestring = strcontent[begin_cut:end_cut]
		locatestring = locatestring[18:(locatestring.find("new Listview") - 2)]
		return json.loads(locatestring)
	return -1

def main():
	location_json = create_location_tab()
	if location_json != -1:
		loop_over_files(location_json)
	else:
		print("Error ")
		exit(84)

main()