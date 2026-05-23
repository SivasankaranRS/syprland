--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Steam Games: Enable tearing (immediate) and force fullscreen
-- hl.window_rule({
--     name  = "steam-games-performance",
--     match = { class = "category:steam_app_.*" },

--     immediate  = true,
--     fullscreen = true,
-- })

-- Picture in Picture Rule
hl.window_rule({
	name = "brave-pip",
	match = {
		title = "^(Picture in picture)$",
	},
	float = true,
	pin = true,
	size = { 320, 180 },
	-- Moves it to the bottom right corner (monitor-local coordinates)
	move = { "monitor_w - 330", "monitor_h - 190" },
})

-- Bluetooth Manager Rule
hl.window_rule({
	name = "bluetooth",
	match = {
		class = "blueman-manager",
	},
	float = true,
	size = { "monitor_w * 0.5", "monitor_h * 0.5" },
	center = true,
	animation = "popin",
})

-- FIle Manager
hl.window_rule({
	name = "thunar",
	match = {
		class = "thunar",
	},
	float = true,
	size = { "monitor_w * 0.5", "monitor_h * 0.5" },
	center = true,
	animation = "popin",
})

-- Audio Control Rule
hl.window_rule({
	name = "pavucontrol",
	match = {
		class = "org.pulseaudio.pavucontrol",
	},
	float = true,
	size = { "monitor_w * 0.5", "monitor_h * 0.5" },
	center = true,
	animation = "popin",
})

-- Kitty Rule
hl.window_rule({
	name = "kitty",
	match = {
		class = "kitty",
	},
	float = true,
	size = { "monitor_w * 0.5", "monitor_h * 0.5" },
	animation = "popin",
})

-- xdg-desktop-portal-gtk
hl.window_rule({
	name = "xdg-desktop-portal-gtk",
	match = {
		class = "xdg-desktop-portal-gtk",
	},
	float = true,
	size = { "monitor_w * 0.5", "monitor_h * 0.5" },
	center = true,
	animation = "popin",
})
