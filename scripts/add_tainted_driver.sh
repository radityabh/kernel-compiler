#!/bin/bash

#-----------wifi driver-------------------

drw="../tmp_modules/lib/modules/${kver}/driver/net/realtek/"

git clone -b v5.3.9 https://github.com/aircrack-ng/rtl8188eus "rtl8188eu"
cd rtl8188eu
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- KSRC=../
mkdir -p $drw/rtl8188eu
cp -f *.ko $drw/rtl8188eu
cd ..

git clone https://github.com/pvaret/rtl8192cu-fixes "rtl8192cu"
cd rtl8192cu
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- KSRC=../
mkdir -p $drw/rtl8192cu
cp -f *.ko $drw/rtl8192cu
cd ..

git clone -b v5.6.4.2 https://github.com/aircrack-ng/rtl8812au "rtl8812au"
cd rtl8812au
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- KSRC=../
mkdir -p $drw/rtl8812au
cp -f *.ko $drw/rtl8812au
cd ..