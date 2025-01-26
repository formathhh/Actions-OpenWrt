#!/bin/bash

# patch
for patch in `find build-files/patch/openwrt/${1}/*.patch | LC_ALL=C sort -u`
do
	# detect and remove files which patch will create
	lsdiff -s --strip=1 "${patch}" | grep '^+' | awk '{print $2}' | xargs -I % sh -c 'rm -f %'
	echo "==> Processing file $patch"
	patch --batch --silent -p1 -N < "${patch}" > /dev/null 2>&1
	if [ $? -eq 0 ]
	then
		echo "<== [S] patch file $patch"
	else
		echo "<== [F] patch file $patch"	
	fi
done
