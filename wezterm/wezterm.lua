local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- =========================================================
--  1. THE INDUSTRIAL PALETTE
-- =========================================================
config.colors = {
	foreground = "#f2f4f8",
	background = "#161616", -- THE VOID
	cursor_bg = "#FF0000", -- CRITICAL RED
	cursor_fg = "#161616",
	cursor_border = "#FF0000",
	selection_fg = "#161616",
	selection_bg = "#FF0000",
	scrollbar_thumb = "#333333",

	split = "#333333", -- Border between panes

	tab_bar = {
		background = "#0d0d0d",
		active_tab = {
			bg_color = "#161616",
			fg_color = "#FF0000", -- Red text for active
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#0d0d0d",
			fg_color = "#666666",
		},
		inactive_tab_hover = {
			bg_color = "#333333",
			fg_color = "#f2f4f8",
		},
	},
}

-- =========================================================
--  2. TYPOGRAPHY
-- =========================================================
config.font = wezterm.font_with_fallback({
	"Monaspace Neon",
	"JetBrains Mono",
	"Apple Color Emoji",
})

config.font_size = 15.0
config.line_height = 1.1

-- =========================================================
--  4. UI STRUCTURE (Minimalist)
-- =========================================================
config.window_decorations = "RESIZE" -- Remove title bar (macOS)
config.enable_tab_bar = false

return config
