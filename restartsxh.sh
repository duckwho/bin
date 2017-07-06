#!/bin/sh
killall sxhkd &
(sleep 3s && sxhkd) &
