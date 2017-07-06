#!/bin/sh
killall emacs &
(sleep 3s && XMODIFIERS=@im="" emacs --daemon)
