#!/bin/sh
clear
echo; echo 'Installing BT patch 6.+'; echo

RELEASE_TAG=7.6.205
FILE1=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v6/BTPanel/static/js/index.js
FILE2=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v6/BTPanel/__init__.py
FILE3=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v6/BTPanel/templates/default/bind.html
FILE4=https://cdn.jsdelivr.net/gh/ONode/BTB@$RELEASE_TAG/v6/BTPanel/templates/default/layout.html
BASE_PANEL=/www/server/panel

echo 'Searching for the working version'

if [ ! -d $BASE_PANEL ];then
	echo "BT is not install, exit."
	exit
fi

wget -q $FILE1 -O $BASE_PANEL/BTPanel/static/js/index.js
wget -q $FILE2 -O $BASE_PANEL/BTPanel/__init__.py
wget -q $FILE3 -O $BASE_PANEL/BTPanel/templates/default/bind.html
wget -q $FILE4 -O $BASE_PANEL/BTPanel/templates/default/layout.html

cd $BASE_PANEL

sh init.sh reload

echo '... done with the new patch 🫕'
echo 'Installation has completed 🌮'