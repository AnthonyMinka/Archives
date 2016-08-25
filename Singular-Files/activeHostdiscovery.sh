#!/bin/sh
ping -b -c 1 255.255.255.255
clear
arp -a|more
