#!/bin/bash
MIXER="default"
[ -n "$(lsmod | grep pulse)" ] && MIXER="pulse"
[ -n "$(lsmod | grep jack)" ] && MIXER="jackplug"
MIXER="${2:-$MIXER}"

# The instance option sets the control to report and configure
# This defaults to the first control of your selected mixer
# For a list of the available, use `amixer -D $Your_Mixer scontrols`
SCONTROL="${BLOCK_INSTANCE:-$(amixer -D $MIXER scontrols |
                  sed -n "s/Simple mixer control '\([A-Za-z ]*\)',0/\1/p" |
                  head -n1
                )}"

# The first parameter sets the step to change the volume by (and units to display)
# This may be in in % or dB (eg. 5% or 3dB)
STEP="${1:-5%}"

vol=`amixer get Master | grep 'Front Right:' | awk '$0~/%/{print $5}' | tr -d '[]'`
mute=`amixer get Master | grep 'Front Right:' | awk '$0~/%/{print $6}'`

if [ $mute == "[on]" ]
then
    if [ $vol == "100%" ]
    then
        echo ""  $vol
    elif [ $vol \< "1%" ]
        then
        echo "" $vol
    elif [ $vol \< "57%" ]
        then
        echo "" $vol
    else
        echo "" $vol
    fi
else
    echo " MUTE"
fi
