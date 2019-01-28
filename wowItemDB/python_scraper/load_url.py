#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re
import sys

def get_category(name):
	file_name = "../links/" + name + "_url.txt"
	category_file = open(file_name, "w")
	if (name.find("belts") != -1):
		page_link = 'https://www.wowhead.com/' + name + '/live-only:on?filter=161:178:161:195:172;1:1:1:1:2;0:0:0:0:0'
	elif (name.find("mail") == -1 and name.find("plate") == -1 and name.find("cloth") == -1 and name.find("leather") == -1 and name.find("belts") == -1):
		page_link = 'https://www.wowhead.com/' + name + '/live-only:on?filter=161:178:161:195:172;1:1:1:1:2;0:0:0:0:0'
	else:
		page_link = 'https://www.wowhead.com/' + name + '-armor/live-only:on?filter=161:178:161:195:172;1:1:1:1:2;0:0:0:0:0'
	page_response = requests.get(page_link, timeout=10)
	page_content = BeautifulSoup(page_response.content, "html.parser")

	strcontent = page_content.prettify()
	array = re.findall('id":\d+,"level', strcontent)
	for lines in array:
		item_id = re.search('\d+', lines)
		url = "https://www.wowhead.com/item=" + str(item_id.group(0))
		category_file.write(url)
		category_file.write('\n')
	print(name + " filled with all the wowhead URLS")

def get_all_categories(names):
	for name in names:
		get_category(name)

def main():
	cat_names = ["cloaks", "mail-shoulder", "mail-chest", "mail-foot", "mail-hand", "mail-head", "mail-belts", "mail-leg",
	"plate-shoulder", "plate-chest", "plate-foot", "plate-hand", "plate-head", "plate-belts", "plate-leg",
	"cloth-shoulder", "cloth-chest", "cloth-foot", "cloth-hand", "cloth-head", "cloth-belts", "cloth-leg",
	"leather-shoulder", "leather-chest", "leather-foot", "leather-hand", "leather-head", "leather-belts", "leather-leg",
	"daggers", "fist-weapons", "one-handed-axes", "one-handed-maces", "one-handed-swords", "warglaives", "polearms",
	"staves", "two-handed-axes", "two-handed-maces", "two-handed-swords", "bows", "crossbows", "guns", "wands"]

	found = 0
	if len(sys.argv) <= 1:
		get_all_categories(cat_names)
	else:
		for args in sys.argv:
			for cat in cat_names:
				if args == cat:
					get_category(args)
					found = 1
			if found == 0:
				print(args + " IS NOT A CATEGORY")
			found = 0

if __name__ == "__main__":
    main()