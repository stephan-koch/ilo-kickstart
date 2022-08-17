#!/bin/bash
# $1 = playboobdir, where to act in
# $2 = hostname to distinguish between hosts
# $3 = webserver-dir
#
cd $1 || exit 99
#cd notebooks/synergy/ilocollection || exit 99
mkdir stickdir 2>/dev/null

BASEDIR=$( dirname $0 )
cp $BASEDIR/usbstick.img stickks.img
DEV=$(kpartx -av stickks.img |awk '{ print $3 }')
mount /dev/mapper/${DEV} stickdir || exit 98
cp ks.cfg stickdir
umount stickdir
kpartx -d stickks.img
mv stickks.img ${3}/stickks-${2}.img || exit 97
chmod 666 ${3}/stickks-${2}.img
