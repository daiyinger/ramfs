#! /bin/sh
mkdir -p /dev/pts
mount -n -t devpts none /dev/pts
telnetd &