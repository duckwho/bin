#!/bin/bash
killall polybar &
# (sleep 3s && polybar bottom) &
(sleep 1s && polybar top) &
