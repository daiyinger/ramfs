#! /bin/sh
mdev -s 
mount /dev/mmcblk0p2 /mnt
mkdir /lib
echo "copy /lib"
cp -r /mnt/lib /
echo "copy /lib end"
modprobe rtl8192cu
cp -rf /mnt/sbin/wpa_*  /sbin/
cp -rf /mnt/etc/wpa* /etc/
cp -rf /mnt/etc/net* /etc/
mkdir -p usr/lib/arm-linux-gnueabihf
cp -f /mnt/usr/lib/arm-linux-gnueabihf/libp* /usr/lib/arm-linux-gnueabihf/
cp -f /mnt/usr/lib/arm-linux-gnueabihf/libss* /usr/lib/arm-linux-gnueabihf/
cp -f /mnt/usr/lib/arm-linux-gnueabihf/libcr* /usr/lib/arm-linux-gnueabihf/
cp /mnt/usr/lib/arm-linux-gnueabihf/liblz4.so.1 /usr/lib/arm-linux-gnueabihf
cp /mnt/usr/bin/perl /usr/bin/
find /etc -name "wpa_supplicant.conf" | xargs perl -pi -e 's|GROUP=netdev|#|g'
mkdir -p /var/run/wpa_supplicant
wpa_supplicant -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf &
ifconfig wlan0 192.168.3.12
umount /mnt