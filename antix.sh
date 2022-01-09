# Inspired from https://www.antixforum.com/forums/topic/reverse-natural-scrolling/#post-11782
echo "Configure touchpad to natural (i.e. tablet-like) scrolling"
echo "You only need to run this once before you build your seed ISO snapshot."
echo "Alternatively, you can run this once for each LiveUSB stick."
sudo sed -i '/EndSection/i \
	Option		"VertScrollDelta"       "-48"   # enable natural scroll\
	Option		"HorizScrollDelta"      "-48"   # enable natural scroll\
' /etc/X11/xorg.conf.d/synaptics.conf
