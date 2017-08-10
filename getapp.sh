#!/bin/bash

clear

USERNAME=$(whoami)
WHEREAMI=$(pwd)

clear

bash <(curl -s https://raw.githubusercontent.com/alectramell/appstore/master/main.sh)

clear
