local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Define the color scheme
local moscovium = {
	-- The default foreground color
	foreground = "#D4C5B0",
	-- The default background color
	background = "#1C1C1E",

	-- Cursor colors
	cursor_bg = "#D4C5B0",
	cursor_fg = "#1C1C1E",
	cursor_border = "#D4C5B0",

	-- Selection colors
	selection_fg = "#D4C5B0",
	selection_bg = "#454547",

	-- Scrollbar
	scrollbar_thumb = "#454547",

	-- Split pane dividers
	split = "#454547",

	-- ANSI colors
	ansi = {
		"#1C1C1E", -- black
		"#B85450", -- red
		"#6B7456", -- green
		"#C17A5F", -- yellow
		"#4A5F7F", -- blue
		"#7A6B7F", -- magenta
		"#5A7A7A", -- cyan
		"#D4C5B0", -- white
	},

	-- Bright ANSI colors
	brights = {
		"#454547", -- bright black
		"#B85450", -- bright red
		"#6B7456", -- bright green
		"#C17A5F", -- bright yellow
		"#4A5F7F", -- bright blue
		"#7A6B7F", -- bright magenta
		"#5A7A7A", -- bright cyan
		"#F2F2F7", -- bright white
	},

	-- Tab bar colors
	tab_bar = {
		background = "#2A2A2C",

		active_tab = {
			bg_color = "#4A5F7F",
			fg_color = "#D4C5B0",
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#2A2A2C",
			fg_color = "#8E8E93",
		},

		inactive_tab_hover = {
			bg_color = "#454547",
			fg_color = "#D4C5B0",
		},

		new_tab = {
			bg_color = "#2A2A2C",
			fg_color = "#5A7A7A",
		},

		new_tab_hover = {
			bg_color = "#454547",
			fg_color = "#D4C5B0",
		},
	},
}

-- Register the color scheme
wezterm.on("update-right-status", function(window, pane)
	-- Optional: Custom status bar
	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#5A7A7A" } },
		{ Text = "  Dr. Moscovium " },
	}))
end)

config.colors = moscovium
-- =========================================================
--  2. TYPOGRAPHY
-- =========================================================
config.font = wezterm.font_with_fallback({
	"Monaspace Neon",
	"JetBrains Mono",
	"Apple Color Emoji",
})

-- TODO Make this font size depend on the screen size
config.font_size = 20.0
config.line_height = 1.1

-- =========================================================
--  4. UI STRUCTURE (Minimalist)
-- =========================================================
config.window_decorations = "RESIZE" -- Remove title bar (macOS)
config.enable_tab_bar = false

return config
