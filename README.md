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
git clone @git
```

### Running 

Once you have everything installed, you have access to a Docker environment with 2 commands :
* loadUrls
* getDatas

### LoadUrls

loadUrls is a Python program that will load all wowhead urls from a certain category into a .txt files. Those files will be the ones that the getData program will use to create the database.

loadUrls can take multiple arguments given multiple categorys :

|Category|Argument Available|
|---|---|
|1H Weapons| daggers, fist-weapons, one-handed-axes, one-handed-maces, one-handed-swords, warglaives, guns, wands|
|2H Weapons| polearms, staves, two-handed-axes, two-handed-maces, two-handed-swords, bows, crossbows|
|Mail|mail-shoulder, mail-chest, mail-foot, mail-hand, mail-head, mail-belts, mail-leg|
|Plate| plate-shoulder, plate-chest, plate-foot, plate-hand, plate-head, plate-belts, plate-leg,  |
|Leather   | leather-shoulder, leather-chest, leather-foot, leather-hand, leather-head, leather-belts, leather-leg  |
|Cloth| cloth-shoulder, cloth-chest, cloth-foot, cloth-hand, cloth-head, cloth-belts, cloth-leg|

You can choose from 1 to all arguments. Example : 

```
./loadUrls cloth-leg cloth-belts

# This will load all the item url's from those categorys
```

Or you can put no arguments. Example : 

```
./loadUrls


# This will load all the item url's from all categorys
```

### GetDatas


## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
