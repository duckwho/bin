#!/usr/bin/env dash
state=$(bspc query -T -n |  grep -o -P '(?<=state\":\").*(?=\",\"lastState)')

if [ "${state}" = "tiled" ] ;
then
    bspc node -f north &
elif [ "${state}" = "floating" ] ;
then
    wtp 967 555 939 511 $(pfw) &
fi
