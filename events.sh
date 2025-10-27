#!/bin/bash
#encoding=utf8

# Override: Fire TV Boot
if [[ "$line" == *"Amazon Fire TV Remote"* ]];then
    start_app "$WOLF_FIRE_LAUNCHER"
fi

# Remap: Home
if [[ "$line" == *"000c0223"* ]];then
    start_app "$WOLF_FIRE_LAUNCHER"
fi

# Remap: Netflix
if [[ "$line" == *"02e8"* ]];then
    start_app "$PLEX"
fi
