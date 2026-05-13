#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
RECORD_DIR="$HOME/Videos/ScreenRecords"


timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

options="📸 Screenshot (Region)
📸 Screenshot (Window)
📸 Screenshot (Monitor)
🎥 Record (Region)
🎥 Record (Window)
🎥 Record (Monitor)
🛑 Stop Recording"

choice=$(printf "%s\n" "$options" | fuzzel --dmenu --prompt="Capture: " --width=30 --lines=7)

[ -z "$choice" ] && exit 0

take_screenshot() {
    mode="$1"

    before=$(find "$SCREENSHOT_DIR" -type f | sort)

    hyprcap shot "$mode" --output "$SCREENSHOT_DIR"

    sleep 1

    newest=$(find "$SCREENSHOT_DIR" -type f | sort | tail -n 1)

    if [ -f "$newest" ]; then
        mv "$newest" "$SCREENSHOT_DIR/screenshot_$timestamp.png"
    fi
}

start_recording() {
    mode="$1"

    hyprcap rec "$mode" --output "$RECORD_DIR"

    sleep 1

    newest=$(find "$RECORD_DIR" -type f | sort | tail -n 1)

    if [ -f "$newest" ]; then
        extension="${newest##*.}"
        mv "$newest" "$RECORD_DIR/recording_$timestamp.$extension"
    fi
}

case "$choice" in
    "📸 Screenshot (Region)")
        take_screenshot region
        ;;

    "📸 Screenshot (Window)")
        take_screenshot window
        ;;

    "📸 Screenshot (Monitor)")
        take_screenshot monitor
        ;;

    "🎥 Record (Region)")
        start_recording region
        ;;

    "🎥 Record (Window)")
        start_recording window
        ;;

    "🎥 Record (Monitor)")
        start_recording monitor
        ;;

    "🛑 Stop Recording")
        hyprcap rec-stop
        ;;

    *)
        exit 0
        ;;
esac