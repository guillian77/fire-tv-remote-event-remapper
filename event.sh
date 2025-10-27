#!/usr/bin/env bash

# ----------------------------------------------------------------------------------------------------------------------
# CONFIG
# ----------------------------------------------------------------------------------------------------------------------

# IP address of your device.
DEVICE_IP="192.168.XXX.XXX"

# Device port (default: 5555)
# Generally does not need to edit this parameter.
DEVICE_PORT=5555

# Delay before an event is triggered and starting the app.
# Try to increase by 0.15 needed.
BOOT_DELAY=0.15

# ----------------------------------------------------------------------------------------------------------------------
# APPS
# ----------------------------------------------------------------------------------------------------------------------

WOLF_FIRE_LAUNCHER="com.wolf.firelauncher/com.wolf.firelauncher.screens.launcher.LauncherActivity"
PLEX="com.plexapp.android/com.plexapp.plex.activities.SplashActivity"

# ----------------------------------------------------------------------------------------------------------------------
# FUNCTIONS
# ----------------------------------------------------------------------------------------------------------------------
function start_app() {
    application="$1"

    [ -z "$application" ] && echo "Missing application name" && exit 1

    sleep $BOOT_DELAY

    echo "[ApplicationManager] Start ${application}"

    adb shell am start -n $application
}

function connect_device() {
    echo "Connecting to device"

    device_count=0

    while [[ $device_count == 0 ]]; do
    # Connect
    adb tcpip ${DEVICE_PORT} || true
    adb connect ${DEVICE_IP}:${DEVICE_PORT} || true

    ##

    # Check device count
    device_count=$(adb devices | grep -w "device" | wc -l)

    echo "Connected devices: ${device_count}"

    [[ $device_count == 0 ]] && echo "Retry in 1 second.." && sleep 1
done
}

# ----------------------------------------------------------------------------------------------------------------------
# EVENT TRIGGERS
# ----------------------------------------------------------------------------------------------------------------------

connect_device

echo "Monitoring events"
adb shell getevent -l | while IFS= read -r line; do
    echo "$line"

    # Remap: Home
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
done
