#!/usr/bin/env dash
state=$(bspc query -T -n |  grep -o -P '(?<=state\":\").*(?=\",\"lastState)')

if [ "${state}" = "tiled" ] ;
then
    bspc node -s north &
elif [ "${state}" = "floating" ] ;
then
    wtp 0 30 1906 511 $(pfw) &
fi
