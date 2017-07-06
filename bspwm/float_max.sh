#!/usr/bin/env dash
state=$(bspc query -T -n |  grep -o -P '(?<=state\":\").*(?=\",\"lastState)')
y=$(bspc query -T -n |  grep -o -P '(?<=floatingRectangle).*(?=}})' | grep -o -P '(?<=y\":).*(?=,\"w)')
x=$(bspc query -T -n |  grep -o -P '(?<=floatingRectangle).*(?=}})' | grep -o -P '(?<=x\":).*(?=,\"y)')
width=$(bspc query -T -n | grep -o -P '(?<=floatingRectangle).*(?=}})' | grep -o -P '(?<=\"width\":).*(?=,)')
height=$(bspc query -T -n | grep -o -P '(?<=floatingRectangle).*(?=}})' | grep -o -P '(?<=\"height\":).*(?=})')

if [ "${state}" = "tiled" ] ;
then
   bspc desktop -l next &
elif [ "${state}" = "floating" ] ;
then
    y_cur=$(cat ~/bin/bspwm/float_val | grep -o -P '(?<=y).*(?=y)')
    x_cur=$(cat ~/bin/bspwm/float_val | grep -o -P '(?<=x).*(?=x)')
    width_cur=$(cat ~/bin/bspwm/float_val | grep -o -P '(?<=w).*(?=w)')
    height_cur=$(cat ~/bin/bspwm/float_val | grep -o -P '(?<=h).*(?=h)')

    if [ "${height}" = "1036" ] && [ "${width}" = "1906" ] && [ "${x}" = "0" ] && [ "${y}" = "30" ] ;
    then
        wtp "${x_cur}" "${y_cur}" "${width_cur}" "${height_cur}" $(pfw) &
    else
        wtp 0 30 1906 1036 $(pfw) &
        echo "w${width}w h${height}h x${x}x y${y}y" > ~/bin/bspwm/float_val &
    fi
fi
