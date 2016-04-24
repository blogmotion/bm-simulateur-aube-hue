Simulateur d'aube pour ampoule Philips Hue
===

###Description###
Script permettant de simuler le lever du jour sur une ampoule connectée Philips Hue (hors gamme Lux) et son pont.

Script composé d'un unique fichier **reveil.sh** qui permet d'allumer l'ampoule avec plusieurs arguments :

- couleur : orange, bleu, chartreuse, chocolat, cyan, vert, magenta, marron, rouge, rose, jaune, violet, blanc
- intensité cible : 0 à 255
- duree de l'allumage en minute : 1 à 109

###Configuration minimale###
- interpréteur bash

###Utilisation###
Il est recommandé de créer stocker ce script dans **/home/pi/script_bm** pour y stocker le script. Ce script ne nécessite pas de droits root.

```
chmod +x reveil.sh
./reveil.sh <couleur> <intensite> <duree_allumage>
```

###English version ###

###[EN] Description ###
Script to simulate daylight bulb connected on a Philips Hue (except Lux) and its bridge.

The script works with the single file **reveil.sh** which allows for lighting the bulb with several arguments :

- french color : orange, bleu, chartreuse, chocolat, cyan, vert, magenta, marron, rouge, rose, jaune, violet, blanc
- target intensity cible : 0 to 255
- duration of the lighting (minute) : 1 to 109

###[EN] Requirements ###
- bash interpreter

###[EN] Usage ###
It is recommended to put the script in the directory **/home/pi/script_bm**. Does not require root permissions.

```
chmod +x reveil.sh
./reveil.sh <color> <intensity> <lighting_duration>
```