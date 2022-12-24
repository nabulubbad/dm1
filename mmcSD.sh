mkdir /media/sdcard
ln -s /media/sdcard/picon /usr/share/enigma2/picon
ln -s /media/sdcard/picon5030 /data/picon
rm fsfix newf
echo /dev/disk/by-uuid/ > fsfix
blkid | sed -n -e 's/^.*mmcblk1p1.* UUID="//p' | sed -n -e 's/".*$//p' >> fsfix
echo   "  /media/sdcard auto auto,nofail 0 0" >>fsfix
tr --delete '\n' < fsfix > newf
cat newf >>/etc/fstab
rm fsfix newf
# install emc
apt update && apt install enigma2-plugin-extensions-enhancedmoviecenter -y
echo "config.EMC.autoaudio=true">>/etc/enigma2/settings
echo "config.EMC.autoaudio_ac3=true">>/etc/enigma2/settings
echo "config.EMC.epglang=ar_AE">>/etc/enigma2/settings
echo "config.EMC.audlang=en">>/etc/enigma2/settings


