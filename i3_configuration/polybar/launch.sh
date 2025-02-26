#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch the bar
polybar -q main -c /home/jonas/.config/polybar/config.ini

echo "Bars launched..."
