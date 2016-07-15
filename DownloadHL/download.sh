#!/bin/bash
# First argument is fragment amount, often 300, second argument is partial link to file fragment, ex: "http://ns5-vh.akamaihd.net/z/zeetv/93_160404003002.mp4/0_da3fc2b5b799e9ae_Seg1-Frag"
for i in $(eval echo {1..$1});
do
	wget "$2$i"
done
