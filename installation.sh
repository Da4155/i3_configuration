#!/bin/bash

#choose between pc and laptop
read -p "pc or laptop? p/l" device
read -p "do you want to use vim? y/n" vim
read -p "would you like remaped keys? y/n" xmodmap

#installation of required programs for i3
sudo pacman -S feh
sudo pacman -S polybar
sudo pacman -S rofi
sudo pacman -S picom
sudo pacman -S dunst


#i3 configuration files
cp -r i3 ~/.config
echo copied i3 to ~/.config 

#vim config
cp .vimrc ~
echo copied .vimrc to ~

#polybar config
chmod +x polybar/launch.sh
cp -r polybar ~/.config
echo copied polybar to ~/.config

#dunst config
cp -r dunst ~/.config
echo copied dunst to ~/.config

#libinput
sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d
echo copied 30-touchpad.conf to /etc/X11/xorg.conf.d

#xmodmap
cp .Xmodmap ~/.config
echo copied .Xmodmap tp ~/.config
