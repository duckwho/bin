#!/usr/bin/env dash
state=$(bspc query -T -n |  grep -o -P '(?<=state\":\").*(?=\",\"lastState)')

if [ "${state}" = "tiled" ] ;
then
    bspc node -f east &
elif [ "${state}" = "floating" ] ;
then
    wtp 967 30 939 511 $(pfw) &
fi
