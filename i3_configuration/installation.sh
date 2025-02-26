#!/bin/bash

read -d "Laptop (l) oder PC (p)" device

sudo pacman -S feh polybar rofi picom dunst yad xdotool terminator neovim xorg-setxkbmap flameshot

config = ~/.config

cp -r i3 $config

cp -r backgrounds ~/Bilder

cp -r nvim  $config

cp -r polybar $config
chmod +x polybar/launch.sh

cp -r rofi $config

cp -r nvim $config

cp -r flameshot $config

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
if [ $device == 'l' ]; then
	sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d
fi

#fonts
cp -r fonts ~/.local/share/
