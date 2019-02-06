# CheckMyMog - WoWItemDB

CheckmyMog is a WoW addon that can tell you informations about a targeted player's transmogrification. 

It is based on our own LUA librairy and database : wowItemDB.

This document will mostly speak about the librairy and database, here is the Curse Link for the Addon : [checkmymog](https://wow.curseforge.com/projects/checkmymog)

## Getting Started

We made a docker to avoid any dependencies issues, you can clone it from our github.

### Prerequisites

Install the latest version of docker.

For Linux : 

```
sudo apt install docker-ce
```

### Installing

Then, clone the repisitory from github or by the command-line :

```
git clone https://github.com/Leom3/checkmymogHubProject.git
```

### Running 

Once you have everything installed, you have access to a Docker environment with 2 programs :
* load_urls
* get_datas

You'll need to launch the Docker in order to use those programs. To do so :


GIF DOCKER 

### Load_urls

load_urls is a Python program that will load all wowhead urls from a certain category into a .txt file. Those files will be the ones that the getData program will use to create the database. They will be stocked in wowItemDB/links folder.

load_urls can take multiple arguments given multiple categorys :

|Category|Argument Available|
|---|---|
|1H Weapons| daggers, fist-weapons, one-handed-axes, one-handed-maces, one-handed-swords, warglaives, guns, wands|
|2H Weapons| polearms, staves, two-handed-axes, two-handed-maces, two-handed-swords, bows, crossbows|
|Mail|mail-shoulder, mail-chest, mail-foot, mail-hand, mail-head, mail-belts, mail-leg|
|Plate| plate-shoulder, plate-chest, plate-foot, plate-hand, plate-head, plate-belts, plate-leg,  |
|Leather   | leather-shoulder, leather-chest, leather-foot, leather-hand, leather-head, leather-belts, leather-leg  |
|Cloth| cloth-shoulder, cloth-chest, cloth-foot, cloth-hand, cloth-head, cloth-belts, cloth-leg|

first , go to the scraping folder :

```
$> cd wowItemDB/python_scraper
```


You can choose from 1 to all arguments. Example : 

```
$> ./loadUrls cloth-leg cloth-belts

# This will load all the item url's from those categorys
```

Or you can put no arguments. Example : 

```
$> ./load_urls


# This will load all the item url's from all categorys
```

If it works correctly, you'll see something like : 

![gif](https://media.giphy.com/media/1wmxDKa2UhHqJcuoPH/giphy.gif)

### get_datas

get_datas is the program that will build LUA database file, based on all the wowhead links files that are gathered in the wowItemDB/links folder.

It will show you a progressbar of the gathering of every category and will end when all the categorys will be done.

You also need to launch this command in your docker. It takes no arguments and will look like :

```
$> ./get_datas


# This will load a database from the .txt files
```

![gif2](https://media.giphy.com/media/452YCnEIToU6KEZTVi/giphy.gif)

Once a category is ended, the next one is automatically launched after. 

You can stop the program by doing a CTRL + C but be if you do it in the middle of a loading, you will need to start again the collection that has been stoped.

![gif3](https://media.giphy.com/media/3gMrpZg2B4UiubmJRL/giphy.gif)


If you do it collection by collection and not everything at a time, remember to remove the links.txt in the /links folder to not reload it again !

#### How does it work ?

get_datas use all the links in the .txt files to then request the HTML pages of wowhead to get the informations, and then write them down in an LUA-like way in the db.lua files, so that we can use them in wow addons.

Here is a simple explanation : 

![gif4](https://media.giphy.com/media/SKwbdbnPtOXaUTJYwg/giphy.gif)

To conclude, get_datas will build a complete lua database folder that can be used with some functions that we created and that we explain [here](#wowitemdb)

## wowItemDB


wowItemDB is a LUA file that you need to include in your .toc file of your addon in addition to the database file that we created [here](#get_datas)

your .toc file must include all of those file in order to use our functions.

![imagetoc](/ressources/filetocscreen.png)

Once you have include everything inside your addon folder, you can use those functions :

|function name|Arguments|return value|
|-------------|---------|------------|
|wowItemDB.getSource|item name, item ID|name of the source. Example : Yogg'Saron|
|wowItemDB.getLocation|item name, item ID|name of the location. Example : Ulduar|
|wowItemDB.getExpansion|item name, item ID|name of the expansion. Example : Battle For Azeroth|
|wowItemDB.getTerritory|item name, item ID|name of the territory. Alliance, Horde or War Zone|
|wowItemDB.getCategoryTerritory|item name, item ID|name of the location. Example : Raid, Dungeon, Open World|
|wowItemDB.getDropRate|item name, item ID|drop rate of the Item. Example : 15.0 (it's in percentage|

all those functions can be used in all of your lua files.


## Built With

* [requests](http://docs.python-requests.org/en/master/) - Request handler used
* [bs4](https://www.crummy.com/software/BeautifulSoup/bs4/doc/) - HTML parser
* [progressbar](https://pypi.org/project/progressbar2/) - Progressbar Handler

## Versioning

The Addon is still considered as "BETA" version because of the lack of PVP items. the db generator is version 1.0.0

## Authors

* **Leo Maignan** - *DB generator, addon frame*
* **Matthias Gayaud** - *Docker, wowItemDB librairy*
* **Charly Dai** - *DB generator, addon*

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
