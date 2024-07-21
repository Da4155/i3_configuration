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

#background
mkdir ~/dotfiles
cp backgrounds ~/dotfiles

#vim config
if [vim == y]
then
	cp vimrc ~/.vimrc
	echo copied .vimrc to ~
fi

#polybar config
chmod +x polybar/launch.sh
cp -r polybar ~/.config
cp -r polybar-scripts ~ 
echo copied polybar to ~/.config

#dunst config
cp -r dunst ~/.config
echo copied dunst to ~/.config

#libinput
sudo cp 50-my-screensaver.conf /etc/X11/xorg.conf.d
if [device == l]
then
	sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d
	echo "copied 30-touchpad.conf & 50-my-screensaver.conf to /etc/X11/xorg.conf.d"
fi

#xmodmap
if [xmodmap == y]
then
	sudo pacman -S xmodmap
	chmod +x Xmodmap
	cp Xmodmap ~/.config/.Xmodmap
	echo copied .Xmodmap tp ~/.config
fi
