#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re
import sys
import os

def loop_over_files(location_tab):
	for files in os.listdir("../links"):
		filename = "../links/" + files
		with open(filename) as f:
			content = f.read().splitlines()
			for item in content:
				page_response = requests.get(item, timeout=10)
				page_content = BeautifulSoup(page_response.content, "html.parser")
				name = page_content.find("h1", {"class" : "heading-size-1"}).getText()
				while 1:
					i = 0 + 1

def create_location_tab():
	locations = {}
	page_response = requests.get("https://www.wowhead.com/zones")
	page_content = BeautifulSoup(page_response.content, "html.parser")
	strcontent = str(page_content.prettify())
	print (strcontent)

def main():
	location_tab = create_location_tab()
	#loop_over_files(location_tab)

main()