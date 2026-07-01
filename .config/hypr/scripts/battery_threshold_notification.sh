#!/bin/bash

BIN_PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

export WAYLAND_DISPLAY="wayland-0"

BAT_DIR="/sys/class/power_supply/BAT0"
DTHRESHOLD=25
CTHRESHOLD=76

STATE_FILE="/tmp/battery_monitor_state"
LAST_STATE=$(cat "$STATE_FILE" 2>/dev/null || echo "NONE")

capacity=$(cat "$BAT_DIR/capacity")
status=$(cat "$BAT_DIR/status")

if [[ "$status" == "Discharging" ]]; then
	if [[ "$capacity" -le "$DTHRESHOLD" ]] && [[ "$LAST_STATE" != "DNOTIFIED" ]]; then
		notify-send -u critical -a "PastreScriptBatteryLevelMonitor" -i battery-empty "Low battery" "${capacity}% battery remaining"
		echo "DNOTIFIED" > "$STATE_FILE"
	fi
elif [[ "$status" == "Charging" ]] || [[ "$status" == "Not Charging" ]]; then
	if [[ "$capacity" -ge "$CTHRESHOLD" ]] && [[ "$LAST_STATE" != "CNOTIFIED" ]]; then
		notify-send -u low -t 10000 -a "PastreScriptBatteryLevelMonitor" -i battery-full "Battery is charged" "${capacity}% battery level"
		echo "CNOTIFIED" > "$STATE_FILE"
	fi
fi
