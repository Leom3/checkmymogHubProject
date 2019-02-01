#!/usr/bin/python
# -*- coding: utf-8 -*-


from bs4 import BeautifulSoup
import requests
import re
import sys
import time
import os
import json
import progressbar

from progressbar import AnimatedMarker, Bar, BouncingBar, Counter, ETA, \
    AdaptiveETA, FileTransferSpeed, FormatLabel, Percentage, \
    ProgressBar, ReverseBar, RotatingMarker, \
    SimpleProgress, Timer, UnknownLength

widgets = [SimpleProgress(),
              Bar(marker='#',left='[',right=']'),
               ' ', ETA(), ' ', FileTransferSpeed()]

pbar = ProgressBar(widgets = widgets)

array1 = ["bite", "cul", "chatte"]

array2 = ["lol", "prout", "test"]
for items in array1:
	print(items)
	for item in progressbar.progressbar(array2, widgets = widgets):
		print("lol")