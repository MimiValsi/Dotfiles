#!/bin/bash

# Check for total monitors connected.
# Check which one is connected.
# Only connect to that one if only 1 external is connected?
# No need to fetch for eDP1(internal monitor).

# grep thoes the job to check how many " connected" monitors are founded
#                                       ^- the space must be explicit or else it returns "disconnected" ones too.

connected=$(xrandr | grep -c " connected")

if [[ $connected == 1 ]]; then
        # echo ${connected}
        # echo "Only main monitor connected"
        xrandr --output eDP1 --auto
else
        # echo ${connected}
        # echo "Multiple monitors connected"

        # Fetch monitor which is connected
        # Regex: Fetch every 'graph' -> letters, numbers, signs but not blanks
        # I don't need to know if 'VIRTUALx' is connected or not
        monitors=$(xrandr | grep " connected" | grep -E -o "^[[:graph:]]{,5}[[:blank:]]")

        # A loop is made coz I don't know which output will be picked.
        # This is intended be used with only one external screen
        for i in ${monitors}; do
                # echo ${i}
                if [[ ${i} == "eDP1" ]]; then
                        continue
                fi
                xrandr --output ${i} --mode 1920x1080 --output eDP1 --off
                break
        done
fi
# xrandr --output HDMI1 --mode 1920x1080 --output eDP1 --off
