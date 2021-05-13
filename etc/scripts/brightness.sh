#!/bin/bash

# Check for argument
if [ -e $1 ]; then
    exit
fi

# Get screen
screen=`xrandr | grep " connected" | cut -f1 -d" "`

# Get current brightness
brightness=`xrandr --verbose | grep "Brightness:" | cut -f2 -d" "`

if [ $1 = "up" ]; then
    brightness=$(awk '{print $1+$2}' <<<"${brightness} 0.1")
fi

if [ $1 = "down" ]; then
    brightness=$(awk '{print $1-$2}' <<<"${brightness} 0.1")
fi

# Update brightness
xrandr --output $screen --brightness $brightness
