#!/bin/bash

# Check for total monitors connected.
# Check which one is connected.
# Only connect to that one if only 1 external is connected?
# No need to fetch for eDP1(internal monitor).

# grep thoes the job to check how many " connected" monitors are founded
#                                       ^- the space must be explicit or else it returns "disconnected" ones too.

connected=$(xrandr | grep -c " connected")

if [[ $connected == 1 ]]; then
        # echo "Only main monitor connected"
        # This is to scale GTK apps in respect to internal monitor dpi
        echo "export GDK_SCALE=2 CLUTTER_SCALE=2 | sudo tee /etc/profile.d/gdk_scaling.sh"
        xrandr --output eDP-1 --auto
else
        # Fetch monitor which is connected
        # Regex: Fetch every 'graph' -> letters, numbers, signs but not blanks
        # I don't need to know if 'VIRTUALx' is connected or not
        monitors=$(xrandr | grep " connected" | grep -E -o "^[[:graph:]]{,5}[[:blank:]]")

        # A loop is made coz I don't know which output will be picked.
        # This is intended be used with only one external screen
        for i in ${monitors}; do
                if [[ ${i} == "eDP-1" ]]; then
                        continue
                fi
                echo "export GDK_SCALE=1 CLUTTER_SCALE=1 | sudo tee /etc/profile.d/gdk_scaling.sh"
                xrandr --output ${i} --mode 1920x1080 --output eDP-1 --off
                break
        done
fi
