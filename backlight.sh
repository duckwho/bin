#!/bin/bash
if [ "$1" == "low" ]
then
    xbacklight -dec 10
    light -U 5
    # ICON="/home/duckwho/bin/bt_img/sun.png"
    ICON="/home/duckwho/bin/bt_img/icon2.png"
    # TEXT=$(xbacklight | grep -o '[0-9][0-9][0-9]\?\.' | grep -o '[0-9][0-9][0-9]\?')
    TEXT=$(light -G | grep -o '[0-9][0-9][0-9]\?\.' | grep -o '[0-9][0-9][0-9]\?')

elif [ "$1" == "high" ]
then
    # xbacklight -inc 10
    light -A 5
    # ICON="/home/duckwho/bin/bt_img/sun.png"
    ICON="/home/duckwho/bin/bt_img/icon2.png"
    # TEXT=$(xbacklight | grep -o '[0-9][0-9][0-9]\?\.' | grep -o '[0-9][0-9][0-9]\?')
    TEXT=$(light -G | grep -o '[0-9][0-9][0-9]\?\.' | grep -o '[0-9][0-9][0-9]\?')

else
    echo "Usage backlight [low | high]\n"
fi

ID=$(cat /home/duckwho/.dunst_backlight)

dunstify -p -r 1336 -i $ICON "Backlight: $TEXT" >/home/duckwho/.dunst_backlight
