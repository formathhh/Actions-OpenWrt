#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# patch
          for patch in `find patch/openwrt/${1}/*.patch | LC_ALL=C sort -u`
          do
              # detect and remove files which patch will create
              lsdiff -s --strip=1 "${patch}" | grep '^+' | awk '{print $2}' | xargs -I % sh -c 'rm -f %'
              echo "Processing file $patch"
              patch --batch --silent -p1 -N < "${patch}"
          done