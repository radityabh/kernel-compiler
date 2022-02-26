#!/bin/bash

#-----------wifi driver-------------------

drw="../tmp_modules/lib/modules/$1/kernel/drivers/net/wireless/realtek/"
echo $drw

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

git clone https://github.com/clnhub/rtl8192eu-linux "rtl8192eu"
cd rtl8192eu
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- KSRC=../
mkdir -p $drw/rtl8192eu
cp -f *.ko $drw/rtl8192eu
cd ..

git clone https://github.com/morrownr/8821cu-20210118 "rtl8821cu"
cd rtl8821cu
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- KSRC=../
mkdir -p $drw/rtl8821cu
cp -f *.ko $drw/rtl8821cu
cd ..

git clone https://github.com/McMCCRU/rtl8188gu "rtl8188gu"
cd rtl8188gu
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- KSRC=../
mkdir -p $drw/rtl8188gu
cp -f *.ko $drw/rtl8188gu
cd ..