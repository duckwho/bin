#!/bin/sh

form="<b>Artist:</b>\t%artist%\n<b>Album:</b>\t%album%\n<b>Title:</b>\t%title%"
while true
do
    mpc idle player

    toprint="`mpc current -f \"$form\" | sed \"s:&:&amp;:g\"`"

    echo $toprint

    size=${#toprint}

    size*""

    artpath="/home/duckwho/usr/aud/$(dirname "$(mpc status -f '%file%' | head -n1)")/cover.jpg"

    rm /tmp/cover.png
    convert -resize 64x64 "$artpath" /tmp/cover.png

    dunstify -a MPD -r 1337 -i "/tmp/cover.png" "            Playing" "$toprint"
done
