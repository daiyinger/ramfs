#! /bin/sh
sudo rm -rf output
mkdir output 
sudo cp -rf * output/
cd output
rm -rf .git*
sudo rm -rf output
find . -not -name "gen_rootfs.sh" | cpio -o -H newc > rootfs.cpio 
gzip -c rootfs.cpio > rootfs.cpio.gz
