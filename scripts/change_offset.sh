#!/bin/bash

#-----------change offset-------------------

loc='./arch/arm64/Makefile'

sed -i 's#0x00080000#0x01080000#g' $loc