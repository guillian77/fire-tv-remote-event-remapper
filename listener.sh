#!/usr/bin/env bash
#encoding=utf8

source "./config.sh"

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

    source "./events.sh"
done
