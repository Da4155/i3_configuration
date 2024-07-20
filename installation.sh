#!/bin/bash

#choose between pc and laptop
echo choose device name
read -p "'l' for laptop and 'C' for PC" device

#installation of required programs for i3
sudo pacman -S feh
sudo pacman -S polybar
sudo pacman -S rofi
#sudo pacman -S compilor
sudo pacman -S dunst


#i3 configuration files
mv i3 ~/.config 

#vim config

#polybar config

#dunst config

#libinput

#if device == l/L

#if device == c/C
