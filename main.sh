#!/bin/bash

clear

USERNAME=$(whoami)
WHEREAMI=$(pwd)

clear

XPASS=$(zenity --title="Sudo Privileges Required" --password)

clear

echo "$XPASS" | sudo -S echo "..."

clear

REQ1=$(which ccrypt)
REQ2=$(which dpkg)
REQ3=$(which dpkg-deb)
REQ4=$(which zenity)

clear

if [ $REQ1 = "/usr/bin/ccrypt" ] && [ $REQ2 = "/usr/bin/dpkg" ] && [ $REQ3 = "/usr/bin/dpkg-deb" ] && [ $REQ4 = "/usr/bin/zenity" ]
then
	echo "REQS=true"
else
	wget https://github.com/alectramell/appstore/raw/master/ccrypt_1.10-4_amd64.deb -O /home/$(whoami)/Desktop/ccrypt_1.10-4_amd64.deb
	echo "$XPASS" | sudo -S dpkg -i /home/$(whoami)/Desktop/ccrypt_1.10-4_amd64.deb
	clear
	sleep 0.5
	clear
	echo "$XPASS" | sudo -S rm /home/$(whoami)/Desktop/ccrypt_1.10-4_amd64.deb
	clear
	echo "$XPASS" | sudo -S apt-get install zenity
	echo "$XPASS" | sudo -S apt-get install dpkg
	echo "$XPASS" | sudo -S apt-get install dpkg-deb
fi

clear

APPID=$(zenity --title="Enter APP ID" --text="(appname-1.0): " --entry)

APPKEY=$(zenity --title="Enter APP Security Key" --password)

clear

wget https://github.com/alectramell/appstore/raw/master/$APPID.deb.cpt -O /home/$(whoami)/Desktop/$APPID.deb.cpt

clear

ccrypt -K "$APPKEY" -d /home/$(whoami)/Desktop/$APPID.deb.cpt

clear

echo "$XPASS" | sudo -S dpkg -i /home/$(whoami)/Desktop/$APPID.deb

clear

sleep 0.5

clear

echo "$XPASS" | sudo -S rm /home/$(whoami)/Desktop/$APPID.deb

clear

notify-send "$APPID" "has been installed!"

clear
