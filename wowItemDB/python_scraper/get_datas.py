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
	1 : 'The Burning Crusade'
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
#2 types de regex possibles :                          #
#  - classification.*location.*name.*count.*outof\:\d+ #
#  - \"boss\"\:\d+.*name.*count.*outof\:\d+            #
########################################################


def find_json_data_in_file(page):
	data = re.search('\"boss\"\:\d+[\s\'\,\"classificationlocation\d+id\:\[\]maxlevel\w\-]+', page)
	if data:
		json_str = data.group(0)
		return json_str
	else:
		data = re.findall('\{\"classification\"\:\d+[\s\,\"location\d+id\:\[\]maxlevel\w\-]+', page)
		if data:
			json_str = data[-1]
			return json_str
		else:
			return -1

def get_location(locate_id, location_json):
	locate_str = ""
	for keys in location_json:
		if (int(keys["id"]) == int(locate_id)):
			if (keys.get("expansion") != None) and keys["expansion"] in expansion_dic:
				locate_str = locate_str + expansion_dic[keys["expansion"]]
			if (keys.get("territory") != None) and keys["territory"] in territory_dic:
				locate_str = locate_str + ', ' +territory_dic[keys["territory"]]
			if (keys.get("category") != None) and keys["category"] in category_dic:
				locate_str = locate_str + ', ' +category_dic[keys["category"]]
			locate_str = locate_str + " : " + keys["name"]
			return locate_str

#####################################################################
#fonction qui boucle sur le fichier d'url pour récuperer les données#
#####################################################################

def loop_over_files(location_json):
	#print (location_json)
	for files in os.listdir("../links"):
		filename = "../links/" + files
		with open(filename) as f:
			content = f.read().splitlines()
			for item in content:
				page_response = requests.get(item, timeout=10)
				page_content = BeautifulSoup(page_response.content, "html.parser")
				name = page_content.find("h1", {"class" : "heading-size-1"}).getText()
				json_string = find_json_data_in_file(page_content.prettify())
				if (json_string == -1):
					print("No source found ! :(")
					continue
				else:
					locate_id = re.search('location\"\:\[\d+\]', json_string)
					locate_id = ((locate_id.group(0)).replace('location":[', '')).replace(']', '')
					location_str = get_location(locate_id, location_json)
					print (location_str)

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