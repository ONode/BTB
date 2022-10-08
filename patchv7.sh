#!/bin/sh
clear
echo; echo 'Installing BT patch 7.+'; echo

RELEASE_TAG=7.6.210
F1=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v7/BTPanel/static/js/index.js
F2=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v7/BTPanel/__init__.py
F3=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v7/BTPanel/templates/default/bind.html
F4=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v7/BTPanel/templates/default/layout.html
F5=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v7/BTPanel/class/panelPlugin.py
F6=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v7/BTPanel/class/ajax.py
F7=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v7/BTPanel/data/pay_type.json
BASE_PANEL=/www/server/panel

echo 'Searching for the working version'

if [ ! -d $BASE_PANEL ];then
	echo "BT is not install, exit."
	exit
fi

wget -q $F1 -O $BASE_PANEL/BTPanel/static/js/index.js
wget -q $F2 -O $BASE_PANEL/BTPanel/__init__.py
wget -q $F3 -O $BASE_PANEL/BTPanel/templates/default/bind.html
wget -q $F4 -O $BASE_PANEL/BTPanel/templates/default/layout.html
wget -q $F5 -O $BASE_PANEL/BTPanel/class/panelPlugin.py
wget -q $F6 -O $BASE_PANEL/BTPanel/class/ajax.py
wget -q $F7 -O $BASE_PANEL/BTPanel/data/pay_type.json

cd $BASE_PANEL

sh init.sh reload

echo '... done with the new patch 🫕'
echo 'Installation has completed 🌮'