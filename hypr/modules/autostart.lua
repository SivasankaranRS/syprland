-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("awww-daemon && awww img $HOME/Pictures/Wallpapers/planet.png --transition-type random")
	hl.exec_cmd("cursor-clip --daemon")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
