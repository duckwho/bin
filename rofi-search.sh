#!/bin/bash
echo "" | rofi -dmenu -p "Search:" | xargs -I{} xdg-open https://www.google.com/search?q={} &
