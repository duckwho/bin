#!/usr/bin/env dash
state=$(bspc query -T -n |  grep -o -P '(?<=state\":\").*(?=\",\"lastState)')

if [ "${state}" = "tiled" ] ;
then
    bspc node -f south &
elif [ "${state}" = "floating" ] ;
then
    wtp 0 555 953 511 $(pfw) &
fi
