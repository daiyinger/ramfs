#! /bin/sh
mdev -s 
mount /dev/mmcblk0p2 /mnt
mkdir /lib
echo "copy /lib"
#cp -r /mnt/lib /
mkdir -p /lib/modules/4.14.95-v7\+/kernel/drivers/
cp -r /mnt/lib/modules/4.14.95-v7\+/kernel/drivers/net /lib/modules/4.14.95-v7\+/kernel/drivers/
cp -r /mnt/lib/modules/4.14.95-v7\+/kernel/drivers/net /lib/modules/4.14.95-v7\+/kernel/drivers/
cp -r /mnt/lib/modules/4.14.95-v7\+/kernel/net /lib/modules/4.14.95-v7\+/kernel/
cp -af /mnt/lib/arm-linux-gnueabihf/libdl* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/librt* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libdbus-1.so.3* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libsys* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libse* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/liblz* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libcrypt* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libg* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libpc* /lib/arm-linux-gnueabihf/
#cp -r /mnt/lib/modules/4.14.95-v7\+/kernel/drivers/usb /lib/modules/4.14.95-v7\+/kernel/drivers/
#cp -r /mnt/lib/firmware /lib/
cp -r /mnt/lib/modules/4.14.95-v7\+/kernel/crypto /lib/modules/4.14.95-v7\+/kernel/
mkdir -p /lib/firmware/rtlwifi
cp -af /mnt/lib/firmware/rtlwifi/rtl8192* /lib/firmware/rtlwifi/	
cp -af /mnt/lib/arm-linux-gnueabihf/libcrypt* /lib/arm-linux-gnueabihf/
cp -f /mnt/lib/arm-linux-gnueabihf/libselinux.so.1 /lib/arm-linux-gnueabihf/
echo "copy /lib end"
modprobe rtl8192cu
cp -rf /mnt/sbin/wpa_*  /sbin/
cp -rf /mnt/etc/wpa* /etc/
cp -rf /mnt/etc/net* /etc/
mkdir -p /usr/lib/arm-linux-gnueabihf
cp -af /mnt/usr/lib/arm-linux-gnueabihf/libp* /usr/lib/arm-linux-gnueabihf/
cp -af /mnt/usr/lib/arm-linux-gnueabihf/libss* /usr/lib/arm-linux-gnueabihf/
cp -af /mnt/usr/lib/arm-linux-gnueabihf/libcr* /usr/lib/arm-linux-gnueabihf/
cp -af /mnt/usr/lib/arm-linux-gnueabihf/liblz* /lib/arm-linux-gnueabihf/
cp -af /mnt/usr/bin/perl /usr/bin/
find /etc -name "wpa_supplicant.conf" | xargs perl -pi -e 's|GROUP=netdev|#|g'
mkdir -p /var/run/wpa_supplicant
wpa_supplicant -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf &
ifconfig wlan0 192.168.3.12

#for cifs
mkdir -p /lib/modules/4.14.95-v7\+/kernel/fs/cifs
cp -r /mnt/lib/modules/4.14.95-v7\+/kernel/fs/cifs /lib/modules/4.14.95-v7\+/kernel/fs
insmod /lib/modules/4.14.95-v7\+/kernel/fs/cifs/cifs.ko

umount /mnt
