local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- =========================================================
-- 1. BRAND IDENTITY (The Color Palette)
-- =========================================================
-- Theme: Custom Oxocarbon with "Brand Red" Override
config.colors = {
	foreground = "#f2f4f8", -- Off-White Text
	background = "#161616", -- The Void (Oxocarbon Base)
	cursor_bg = "#FF0000", -- BRAND RED Cursor (High Visibility)
	cursor_fg = "#000000", -- Black text on cursor
	cursor_border = "#FF0000",

	ansi = {
		"#262626", -- Black
		"#FF0000", -- Red (BRAND OVERRIDE - was Pink)
		"#42be65", -- Green
		"#ff7eb6", -- Yellow (Oxocarbon quirk)
		"#33b1ff", -- Blue
		"#be95ff", -- Magenta
		"#3ddbd9", -- Cyan
		"#dde1e6", -- White
	},
	brights = {
		"#393939", -- Bright Black
		"#FF0000", -- Bright Red (BRAND OVERRIDE)
		"#42be65", -- Bright Green
		"#ff7eb6", -- Bright Yellow
		"#33b1ff", -- Bright Blue
		"#be95ff", -- Bright Magenta
		"#3ddbd9", -- Bright Cyan
		"#ffffff", -- Bright White
	},
}

-- =========================================================
-- 2. TYPOGRAPHY (Monaspace Neon)
-- =========================================================
-- Kept your original font stack; it fits the "Schematic" vibe perfectly.
config.font = wezterm.font_with_fallback({
	{ family = "Monaspace Neon", weight = "Regular" },
	"JetBrains Mono Nerd Font",
})

-- Enable Texture Healing for Monaspace
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1", "ss01=1" }
config.font_size = 15.0

-- =========================================================
-- 3. VISUAL STRUCTURE
-- =========================================================
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- BRAND RULE: No Blur, No Transparency.
-- The "Industrial" look requires solid, confident backgrounds.
config.window_background_opacity = 1.0
config.macos_window_background_blur = 0

-- =========================================================
-- 4. KEYBINDINGS
-- =========================================================
config.keys = {
	-- Toggle Fullscreen (Focus Mode)
	{ key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen },

	-- Note: Removed the "Light Mode" toggle.
	-- Your brand does not have a light mode.
}

return config
