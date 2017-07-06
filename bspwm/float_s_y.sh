#!/usr/bin/env dash
state=$(bspc query -T -n |  grep -o -P '(?<=state\":\").*(?=\",\"lastState)')

if [ "${state}" = "tiled" ] ;
then
    bspc node -s west &
elif [ "${state}" = "floating" ] ;
then
    wtp 0 30 953 1036 $(pfw) &
fi
