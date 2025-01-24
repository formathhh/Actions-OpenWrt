#!/bin/bash

# patch
for patch in `find files/patch/openwrt/${1}/*.patch | LC_ALL=C sort -u`
do
	git am $patch
	if [ $? -eq 0 ]
	then
		echo "<== [S] patch file $patch"
	else
		echo "<== [F] patch file $patch"	
	fi
done
