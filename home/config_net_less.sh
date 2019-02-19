#! /bin/sh
mdev -s 
mount /dev/mmcblk0p2 /mnt
#mkdir /lib
echo "copy /lib"
#cp -r /mnt/lib /
mkdir -p /lib/modules/4.14.95-v7+/kernel/drivers/net/wireless/realtek/rtlwifi
cp -r /mnt/lib/modules/4.14.95-v7\+/kernel/drivers/net/wireless/realtek/rtlwifi /lib/modules/4.14.95-v7\+/kernel/drivers/net/wireless/realtek/rtlwifi
#mkdir -p /lib/modules/4.14.95-v7\+/kernel/drivers/net/usb
#cp -f /mnt/lib/modules/4.14.95-v7\+/kernel/drivers/net/usb/r8152.ko /lib/modules/4.14.95-v7\+/kernel/drivers/net/usb/
cp -r /mnt/lib/modules/4.14.95-v7\+/kernel/net /lib/modules/4.14.95-v7\+/kernel/
rm -rf /lib/modules/4.14.95-v7+/kernel/net/can
rm -rf /lib/modules/4.14.95-v7+/kernel/net/6lowpan
rm -rf /lib/modules/4.14.95-v7+/kernel/net/bluetooth
rm -rf /lib/modules/4.14.95-v7+/kernel/net/wimax
cp -r /mnt/lib/modules/4.14.95-v7\+/kernel/crypto /lib/modules/4.14.95-v7\+/kernel/
mkdir -p /lib/firmware/rtlwifi
cp -af /mnt/lib/firmware/rtlwifi/rtl8192* /lib/firmware/rtlwifi/	
cp -af /mnt/lib/arm-linux-gnueabihf/libcrypt* /lib/arm-linux-gnueabihf/
#cp -f /mnt/lib/arm-linux-gnueabihf/libselinux.so.1 /lib/arm-linux-gnueabihf/
echo "copy /lib end"
modprobe rtl8192cu

cp -rf /mnt/sbin/wpa_*  /sbin/
cp -rf /mnt/etc/wpa* /etc/
cp -rf /mnt/etc/net* /etc/

mkdir -p /usr/lib/arm-linux-gnueabihf
cp -af /mnt/lib/arm-linux-gnueabihf/libdl* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/librt* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libdbus-1.so.3* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libsys* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libse* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/liblz* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libcrypt* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libg* /lib/arm-linux-gnueabihf/
cp -af /mnt/lib/arm-linux-gnueabihf/libpc* /lib/arm-linux-gnueabihf/

cp -af /mnt/usr/lib/arm-linux-gnueabihf/libp* /usr/lib/arm-linux-gnueabihf/
cp -af /mnt/usr/lib/arm-linux-gnueabihf/libssl.so* /usr/lib/arm-linux-gnueabihf/
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
