apt update && wget -O /tmp/geminilocale_all.deb http://download.blue-panel.com/geminilocale_gp4.php && apt install -y /tmp/geminilocale_all.deb
#apt update &&  apt install -y gp4-cam-feed-configs_2.0-r4_all.deb

mkdir /media/sdcard
rm fsfix newf
echo /dev/disk/by-uuid/ > fsfix
blkid | sed -n -e 's/^.*mmcblk1p1.* UUID="//p' | sed -n -e 's/".*$//p' >> fsfix
echo   "  /media/sdcard auto auto,nofail 0 0" >>fsfix
tr --delete '\n' < fsfix > newf
cat newf >>/etc/fstab
rm fsfix newf
apt update && apt install /media/sdcard/apps/epgimport-2r219.deb -y
cp /media/sdcard/apps/rytec.sources.xml /etc/epgimport/
ln -s /media/sdcard/picon /usr/share/enigma2/picon
ln -s /media/sdcard/picon5030 /data/picon
# installcam

# install emc
apt update && apt install enigma2-plugin-extensions-enhancedmoviecenter -y
echo "config.EMC.autoaudio=true">>/etc/enigma2/settings
echo "config.EMC.autoaudio_ac3=true">>/etc/enigma2/settings
echo "config.EMC.epglang=ar_AE">>/etc/enigma2/settings
echo "config.EMC.audlang=en">>/etc/enigma2/settings
echo "config.usage.quickzap_bouquet_change=false">>/etc/enigma2/settings

sed  -e '/KEY_CHANNELUP/s/openServiceList/zapDown/' /usr/share/enigma2/keymap.xml -i
sed  -e '/KEY_CHANNELDOWN/s/openServiceList/zapUp/'  /usr/share/enigma2/keymap.xml -i
apt update && apt install /media/sdcard/apps/enigma2-plugin-softcams-ncam-osdreambox_V13.5-r0.deb  -y
#cp /media/sdcard/apps/ncam2.server >> /etc/enigma2/tuxbox/config/oscam.server
cp /media/sdcard/apps/ncam2.server >> /etc/enigma2/tuxbox/config/ncam.server


