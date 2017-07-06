#!/usr/bin/env dash
state=$(bspc query -T -n |  grep -o -P '(?<=state\":\").*(?=\",\"lastState)')

if [ "${state}" = "tiled" ] ;
then
    bspc node -s east &
elif [ "${state}" = "floating" ] ;
then
    wtp 967 30 939 1036 $(pfw) &
fi
