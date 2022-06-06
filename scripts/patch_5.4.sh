#!/bin/bash

#-----------change offset-------------------

loc='./arch/arm64'

sed -i 's#0x00080000#0x01080000#g' "$loc/Makefile"
sed -i 's#\#error TEXT_OFFSET must be less than 2MB#//\#error TEXT_OFFSET must be less than 2MB#g' "$loc/kernel/head.S"

sed -i 's#50000000#100000000#g' "./drivers/mmc/core/sdio.c"

svn checkout https://github.com/radityabh/kernel-compiler/trunk/patch/5.4 patch

for i in patch/*.patch; do patch -p1 < $i; done
rm -rf patch