#!/bin/bash

#choose between pc and laptop
read -p "pc(1) or laptop(2)? 1/2" device
read -p "do you want to use vim (yes=1 no=2)? 1/2" vim
read -p "would you like remaped keys (yes=1 no=2)? 1/2" xmodmap

#installation of required programs for i3
sudo pacman -S feh polybar rofi picom dunst yad xdotool alacritty

#i3 configuration files
cp -r i3 ~/.config
echo copied i3 to ~/.config 

#background
cp -r backgrounds ~/Bilder

#vim config
if [ $vim == "1" ]; then
	cp vimrc ~/.vimrc
	echo copied .vimrc to ~
fi

#polybar config
chmod +x lap/polybar/launch.sh
chmod +x pc/polybar/launch.sh

if [ $device == 2 ]; then   
	cp -r lap/polybar ~/.config
else
	cp -r pc/polybar ~/.config
fi

#rofi
cp -r rofi ~/.config

#scripts
chmod +x scripts/generate_pngs.sh
chmod +x scripts/launcher.sh
chmod +x scripts/loop_pngs.sh
chmod +x scripts/powermenu.sh
chmod +x scripts/styles.sh
chmod +x scripts/style-switch.sh
cp -r scripts ~/.scripts

#dunst config
cp -r dunst ~/.config
echo copied dunst to ~/.config

#libinput
sudo cp 50-my-screensaver.conf /etc/X11/xorg.conf.d
if [ $device == 2 ]; then
	sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d
	echo "copied 30-touchpad.conf & 50-my-screensaver.conf to /etc/X11/xorg.conf.d"
fi

#fonts
cp -r fonts .local/share/

#xmodmap
if [ $xmodmap == "1" ]; then
	sudo pacman -S xorg-xmodmap
	chmod +x Xmodmap
	cp Xmodmap ~/.config/.Xmodmap
	echo copied .Xmodmap tp ~/.config
fi
