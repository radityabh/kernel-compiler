#!/bin/bash

#-----------PATCH KERNEL-------------------

svn checkout https://github.com/radityabh/kernel-compiler/trunk/patch/5.16 patch

for i in patch/*.patch; do patch -p1 < $i; done