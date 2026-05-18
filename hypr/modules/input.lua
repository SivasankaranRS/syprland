---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.5,
        },
    },
})

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace"
})
-- Zoom in and out with a two-finger pinch gestures

hl.gesture({ fingers = 2, direction = "pinch", mods = "SUPER" ,action = "cursorZoom", zoom_level = 1, mode = "live" })

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.device ({
        name = "2.4g-mouse-1",
        sensitivity = -0.5, -- Adjust between -1.0 and 0      
})

hl.config({
    input =  {
        kb_options = "caps:swapescape"
    }
})