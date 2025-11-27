#!/usr/bin/env bash

# Set the icon and a temporary location for the screenshot
tmpbg="/tmp/screen.png"

if [[ -a $tmpbg ]]
then
        rm $tmpbg
fi

# Take a screenshot
scrot "$tmpbg"

# Blur screenshot by resizing and scaling back up
convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

# Lock the screen with the blurred screenshot
i3lock -i "$tmpbg" -e
