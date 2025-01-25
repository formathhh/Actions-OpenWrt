#!/bin/bash

git config --global user.email "githubaction@hotmail.com"
git config --global user.name "githubaction"
# patch
for patch in `find build-files/patch/openwrt/${1}/*.patch | LC_ALL=C sort -u`
do
	git am $patch
	if [ $? -eq 0 ]
	then
		echo "<== [S] patch file $patch"
	else
		echo "<== [F] patch file $patch"	
	fi
done
