#!/bin/bash
#
# Consumes very little of the CPU power/cycles has it only refreshes every 0.7
# seconds. Very portable & simple.
#
while true; do clear; ls -l /dev/pts; sleep 0.7; done
clear;
