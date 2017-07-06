#!/usr/bin/env dash
state=$(bspc query -T -n |  grep -o -P '(?<=state\":\").*(?=\",\"lastState)')

if [ "${state}" = "tiled" ] ;
then
    bspc node -f west &
elif [ "${state}" = "floating" ] ;
then
    wtp 0 30 953 511 $(pfw) &
fi
