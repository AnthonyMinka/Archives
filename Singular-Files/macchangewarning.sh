#!/bin/bash
warnColor='\033[0;31m';
colorReset='\033[0m';
permanentMac=$(macchanger -s wlan0|grep "Permanent"|awk '{print $3}');
currentMac=$(macchanger -s wlan0|grep "Current"|awk '{print $3}');
if [ "$currentMac" != "$permanentMac" ]; then
while [ "$currentMac" != "$permanentMac" ]; do
permanentMac=$(macchanger -s wlan0|grep "Permanent"|awk '{print $3}');
currentMac=$(macchanger -s wlan0|grep "Current"|awk '{print $3}');
echo "Nothing to report."
sleep 1;
clear;
done
printf "${warnColor}Mac address changed unexpectedly!${colorReset}\n"
else
printf "${warnColor}Mac was never changed from the start!${colorReset}\n"
fi
