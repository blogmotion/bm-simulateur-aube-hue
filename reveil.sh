#!/bin/bash
#
# Documentation : http://blogmotion.fr/internet/simulateur-aube-philips-hue-14621
#
# reveil.sh : allume une ampoule Hue
# arguments : ./reveil.sh <couleur> <intensite> <duree_allumage>
# 		couleur orange,blue,chartreuse...
#		intensite [0-255]
#		duree_allumage [1-109] minute
#
# Author: Mr Xhark -> @xhark
# License : Creative Commons http://creativecommons.org/licenses/by-nd/4.0/deed.fr
# Website : http://blogmotion.fr/
VERSION="2016.04.24"

# === BRIDGE INFORMATIONS (MODIFIEZ CECI !) =======================================================
IP=192.168.0.20
USER=1111a2222b3333c4444d5555e66666f
LIGHTID=1

# === VARIABLES (MODIFIABLE) ======================================================================
_transminute=1	# transition entre deux etats (en minute)
_bri=255		# intensite lumiere [0-255]

###################################################################################################
# === NE RIEN TOUCHER A PARTIR DE CETTE LIGNE =====================================================
NBARGS=1
declare -A coulxy # declaration tableau associatif

# couleurs http://www.developers.meethue.com/documentation/hue-xy-values
coulxy["orange"]="[0.613,0.387]"
coulxy["blue"]="[0.139,0.081]"
coulxy["chartreuse"]="[0.2682,0.6632]"
coulxy["chocolate"]="[0.6009,0.3684]"
coulxy["cyan"]="[0.17,0.3403]"
coulxy["green"]="[0.214,0.709]"
coulxy["magenta"]="[0.3787,0.1724]"
coulxy["marron"]="[0.7,0.2986]"
coulxy["red"]="[0.7,0.2986]"
coulxy["rose"]="[0.3644,0.2133]"
coulxy["yellow"]="[0.4432,0.5154]"
coulxy["violet"]="[0.2742,0.1326]"
coulxy["white"]="[0.3227,0.329]"

log="/ramdisk/reveil.log"

# === PARAMETRES ==================================================================================
if [[ $# -eq 1 ]]; then
	couleur=$1
elif [[ $# -eq 2 ]]; then
	couleur=$1
	_bri=$2
elif [[ $# -eq 3 ]]; then
	couleur=$1
        _bri=$2
	_transminute=$3
else
	couleur="green"
fi
# =================================================================================================

# conversion minutes vers 100 ms  (unite=100ms. ex: 1s=>10) [0-65535]
_transition=$(( $_transminute * 60 * 10 ))

# URL
url="http://${IP}/api/${USER}/lights/${LIGHTID}/state"
data="{ \
	\"on\":true,
	\"bri\":$_bri,
	\"xy\":${coulxy[$couleur]},
	\"transitiontime\":$_transition \
}"

# === Affichage ===================================================================================
echo -e "\n\n Couleur: ${couleur} \n Intensite: ${_bri} \n Duree: ${_transminute} min \n\n  $data $url \n\n"

# === cURL ("-s" pour silencieux) =================================================================
curl -H "Accept: application/json" -X PUT --data "${data}" ${url} #>> $log 2>&1

echo -e "\n\n" && exit 1
