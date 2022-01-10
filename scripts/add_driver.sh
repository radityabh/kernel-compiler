#!/bin/bash

#-----------wifi driver-------------------

wd='drivers/net/wireless/realtek'

git clone -b rtl8189fs https://github.com/jwrdegoede/rtl8189ES_linux "$wd/rtl8189fs"
git clone -b master https://github.com/jwrdegoede/rtl8189ES_linux "$wd/rtl8189es"
git clone -b master https://github.com/kelebek333/rtl8188fu "$wd/rtl8188fu"
git clone -b main https://github.com/radityabh/RTL8822CS "$wd/rtl8822cs"


echo "obj-\$(CONFIG_RTL8189FS) += rtl8189fs/" >> "$wd/Makefile"
echo "obj-\$(CONFIG_RTL8189ES) += rtl8189es/" >> "$wd/Makefile"
echo "obj-\$(CONFIG_RTL8188FU) += rtl8188fu/" >> "$wd/Makefile"
echo "obj-\$(CONFIG_RTL8822CS) += rtl8822cs/" >> "$wd/Makefile"

sed -i 's#endif \# WLAN_VENDOR_REALTEK##g' "$wd/Kconfig"
cat << 'EOF' >> "$wd/Kconfig"
source "drivers/net/wireless/realtek/rtl8188fu/Kconfig"
source "drivers/net/wireless/realtek/rtl8189es/Kconfig"
source "drivers/net/wireless/realtek/rtl8189fs/Kconfig"
source "drivers/net/wireless/realtek/rtl8822cs/Kconfig"

endif # WLAN_VENDOR_REALTEK
EOF

#-----------------patch kernel 5.16
sed -i 's#---help---##g' "$wd/rtl8189fs/Kconfig"
sed -i 's#Help message of RTL8189FS##g' "$wd/rtl8189fs/Kconfig"
sed -i 's#---help---##g' "$wd/rtl8189es/Kconfig"
sed -i 's#Help message of RTL8189ES##g' "$wd/rtl8189es/Kconfig"
sed -i 's#---help---##g' "$wd/rtl8188fu/Kconfig"
sed -i 's#Help message of RTL8188FU##g' "$wd/rtl8188fu/Kconfig"