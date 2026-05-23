#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/Wallpapers"
THEME_FILE="$HOME/.config/rofi/wallpicker.rasi"
CACHE_FILE="$HOME/.cache/awww/wallpaper_history.txt"
THEME_TRACKER="$HOME/.cache/awww/theme_mode.txt"

CURRENT_MODE=$(cat "$THEME_TRACKER" 2>/dev/null || echo "dark")

# Ensure directory path exists safely
if [ ! -d "$WALL_DIR" ]; then
  notify-send "Wallpaper Picker" "Drop your background images inside $WALL_DIR"
  exit 1
fi

# Build list mapping image filenames to local paths
ROFI_INPUT=""
while IFS= read -r filepath; do
  filename=$(basename "$filepath")
  # \x00 hides configuration flags from list search while \x1f loads custom path as the icon
  ROFI_INPUT+="$filename\x00icon\x1f$filepath\n"
done < <(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \))

# Run Rofi in dmenu pipeline mode using our custom layout style parameters
SELECTION=$(echo -e -n "$ROFI_INPUT" | rofi -dmenu -i -p "󰸉 Themes" -theme "$THEME_FILE")

# Exit cleanly if window overlay is dismissed
if [ -z "$SELECTION" ]; then
  exit 0
fi

CHOSEN_WALLPAPER="$WALL_DIR/$SELECTION"

echo "$CHOSEN_WALLPAPER" >"$CACHE_FILE"

# Update system graphics assets simultaneously
awww img "$CHOSEN_WALLPAPER" --transition-type random
matugen image "$CHOSEN_WALLPAPER" --prefer darkness -t scheme-content -m "$CURRENT_MODE"

notify-send "Desktop Synced" "Applied layout palette matching $SELECTION" -i "$CHOSEN_WALLPAPER" \
  -t 2000 \
  -h string:x-canonical-private-synchronous:wallpicker
