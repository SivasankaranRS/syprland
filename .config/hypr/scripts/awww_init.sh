#!/usr/bin/env bash

CACHE_FILE="$HOME/.cache/current_wallpaper"
DEFAULT_WALLPAPER="$HOME/Pictures/wallpapers/anime1.jpg" # Fallback if cache is empty
THEME_MODE=$(cat "$HOME/.cache/awww/theme_mode.txt")
# 1. Start the core engine daemon
awww-daemon &

# 2. Give the daemon a brief split-second to finish initializing in memory
sleep 0.5

# 3. Read cache or fall back to default image path
if [ -f "$CACHE_FILE" ]; then
  WALLPAPER=$(cat "$CACHE_FILE")
else
  WALLPAPER="$DEFAULT_WALLPAPER"
fi

# 4. Restore the image and push colors to Matugen/Waybar
if [ -f "$WALLPAPER" ]; then
  awww img "$WALLPAPER" --transition-type none
  matugen image "$WALLPAPER" --prefer darkness --type scheme-content -m $THEME_MODE
fi

