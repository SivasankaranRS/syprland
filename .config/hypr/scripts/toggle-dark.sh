#!/usr/bin/env bash

# File paths (Adjust if your cache or colors file are named differently)
CACHE_FILE="$HOME/.cache/awww/wallpaper_history.txt"
THEME_TRACKER="$HOME/.cache/awww/theme_mode.txt"
GENERATED_CSS="$HOME/.config/waybar/themes/colors.css"

# Fallback image if the cache file is empty
if [ -f "$CACHE_FILE" ]; then
  CHOSEN_WALLPAPER=$(cat "$CACHE_FILE")
else
  CHOSEN_WALLPAPER="$HOME/Pictures/Wallpapers/garou.png"
fi

# Read SwayNC's toggle state
if [ "$SWAYNC_TOGGLE_STATE" = "true" ]; then
  # Button is ON -> Run Matugen in Dark Mode
  mode="Dark"
  echo "dark" >"$THEME_TRACKER"
  matugen image "$CHOSEN_WALLPAPER" -m dark --prefer darkness
else
  # Button is OFF -> Run Matugen in Light Mode
  mode="Light"
  echo "light" >"$THEME_TRACKER"
  matugen image "$CHOSEN_WALLPAPER" -m light --prefer darkness
fi

notify-send "Desktop Synced" "Applied $mode Mode" -i "$CHOSEN_WALLPAPER" \
  -t 2000 \
  -h string:x-canonical-private-synchronous:wallpicker
