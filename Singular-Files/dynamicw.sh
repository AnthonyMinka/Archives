#!/bin/bash
#
# Consumes very little of the CPU power/cycles has it only refreshes every 0.5
# seconds. Very portable. But see dynamictty.sh for better stuff.
#
while true; do clear; w; sleep 0.5; done
