#!/bin/bash
if [ "$1" == "low" ]
then
    pacmd dump|awk --non-decimal-data '$1~/set-sink-volume/{system ("pacmd "$1" "$2" "$3-1000)}'
    # ICON="/home/duckwho/bin/vol_img/down-dark-16.png"
    ICON="/home/duckwho/bin/vol_img/down-light-16.png"
    TEXT=$(amixer get Master | grep -m1 '%' | awk '{print $5}' | sed 's/[^0-9\%]//g')

elif [ "$1" == "high" ]
then
    pacmd dump|awk --non-decimal-data '$1~/set-sink-volume/{system ("pacmd "$1" "$2" "$3+1000)}'
    # ICON="/home/duckwho/bin/vol_img/up-dark-16.png"
    ICON="/home/duckwho/bin/vol_img/up-light-16.png"
    TEXT=$(amixer get Master | grep -m1 '%' | awk '{print $5}' | sed 's/[^0-9\%]//g')

elif [ "$1" == "mute" ]
then
    pacmd dump|awk --non-decimal-data '$1~/set-sink-mute/{system ("pacmd "$1" "$2" "($3=="yes"?"no":"yes"))}'
    # ICON="/home/duckwho/bin/vol_img/mute-dark-16.png"
    ICON="/home/duckwho/bin/vol_img/mute-light-16.png"
    TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g')

else
    echo "Usage volume [low | high | mute]\n"
fi

ID=$(cat /home/duckwho/.dunst_volume)

dunstify -p -r 1336 -i $ICON "Volume: $TEXT" >/home/duckwho/.dunst_volume
