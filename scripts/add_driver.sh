#!/bin/bash

#-----------wifi driver-------------------

wd='drivers/net/wireless/realtek'

git clone -b rtl8189fs https://github.com/jwrdegoede/rtl8189ES_linux "$wd/rtl8189fs"
git clone -b master https://github.com/jwrdegoede/rtl8189ES_linux "$wd/rtl8189es"
git clone -b master https://github.com/kelebek333/rtl8188fu "$wd/rtl8188fu"
git clone -b main https://github.com/radityabh/RTL8822CS "$wd/rtl8822cs"
git clone -b v5.3.9 https://github.com/aircrack-ng/rtl8188eus "$wd/rtl8188eu"
git clone -b master https://github.com/pvaret/rtl8192cu-fixes "$wd/rtl8192cu"
git clone -b v5.6.4.2 https://github.com/aircrack-ng/rtl8812au "$wd/rtl8812au"


echo "obj-\$(CONFIG_RTL8189FS) += rtl8189fs/" >> "$wd/Makefile"
echo "obj-\$(CONFIG_RTL8189ES) += rtl8189es/" >> "$wd/Makefile"
echo "obj-\$(CONFIG_RTL8188FU) += rtl8188fu/" >> "$wd/Makefile"
echo "obj-\$(CONFIG_RTL8822CS) += rtl8822cs/" >> "$wd/Makefile"
echo "obj-\$(CONFIG_RTL8188EU) += rtl8188eu/" >> "$wd/Makefile"
echo "obj-\$(CONFIG_RTL8192CU) += rtl8192cu/" >> "$wd/Makefile"
echo "obj-\$(CONFIG_RTL8812AU) += rtl8812au/" >> "$wd/Makefile"

sed -i 's#endif \# WLAN_VENDOR_REALTEK##g' "$wd/Kconfig"
cat << 'EOF' >> "$wd/Kconfig"
source "drivers/net/wireless/realtek/rtl8188fu/Kconfig"
source "drivers/net/wireless/realtek/rtl8189es/Kconfig"
source "drivers/net/wireless/realtek/rtl8189fs/Kconfig"
source "drivers/net/wireless/realtek/rtl8822cs/Kconfig"
source "drivers/net/wireless/realtek/rtl8188eu/Kconfig"
source "drivers/net/wireless/realtek/rtl8192cu/Kconfig"
source "drivers/net/wireless/realtek/rtl8812au/Kconfig"

endif # WLAN_VENDOR_REALTEK
EOF

#-----------------patch kernel 5.16
sed -i 's#---help---##g' "$wd/rtl8189fs/Kconfig"
sed -i 's#Help message of RTL8189FS##g' "$wd/rtl8189fs/Kconfig"
sed -i 's#---help---##g' "$wd/rtl8189es/Kconfig"
sed -i 's#Help message of RTL8189ES##g' "$wd/rtl8189es/Kconfig"
sed -i 's#---help---##g' "$wd/rtl8188fu/Kconfig"
sed -i 's#Help message of RTL8818FU##g' "$wd/rtl8188fu/Kconfig"
sed -i 's#---help---##g' "$wd/rtl8188eu/Kconfig"
sed -i 's#Help message of RTL8188EU##g' "$wd/rtl8188eu/Kconfig"
cat << 'EOF' >> "$wd/rtl8192cu/Kconfig"
config RTL8192CU
	tristate "Realtek 8192CU USB WiFi"
	depends on USB
EOF
sed -i 's#88XX#8812#g' "$wd/rtl8812au/Kconfig"
sed -i 's#help##g' "$wd/rtl8812au/Kconfig"
sed -i 's#Help message of 8812au##g' "$wd/rtl8812au/Kconfig"