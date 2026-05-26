#!/bin/bash

NORMAL_BATTERY=20
LOW_BATTERY=10
CRITICAL_BATTERY=5

while true; do
  BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
  BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

  if [ "$BATTERY_STATUS" != "Charging" ]; then
    if [ "$BATTERY_LEVEL" -le "$CRITICAL_BATTERY" ]; then
      notify-send -u critical -i battery-empty "Battery critically Low" "Plug in your charger immediately! (${BATTERY_LEVEL}%)" -h string:x-canonical-private-synchronous:battery_status
    elif [ "$BATTERY_LEVEL" -le "$LOW_BATTERY" ]; then
      notify-send -u low -i battery-caution "Battery Low" "Connect to power soon. (${BATTERY_LEVEL}%)" -h string:x-canonical-private-synchronous:battery_status
    elif [ "$BATTERY_LEVEL" -le "$NORMAL_BATTERY" ]; then
      notify-send -u normal -i battery-caution "Battery Low" "Start Connecting to power soon. (${BATTERY_LEVEL}%)" -h string:x-canonical-private-synchronous:battery_status
    fi
  fi

  sleep 60
done
