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
config.font_size = 14.0
config.line_height = 1.1

-- =========================================================
--  3. SESSION MANAGEMENT (The Zellij Replacement)
-- =========================================================
-- This enables "mux" behavior. You attach to this domain
-- to keep sessions alive after closing the window.
config.unix_domains = {
	{
		name = "unix",
	},
}

-- Automatically connect to the unix domain (session) on startup
config.default_gui_startup_args = { "connect", "unix" }

-- =========================================================
--  4. UI STRUCTURE (Minimalist)
-- =========================================================
config.window_decorations = "RESIZE" -- Remove title bar (macOS)
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = fals -- Status bar feel
config.show_new_tab_button_in_tab_bar = false

-- The "Red Line" Status Bar
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "MODE: " .. name
	end

	-- Current Workspace Name
	local workspace = window:active_workspace()

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#FF0000" } },
		{ Text = "█ " }, -- The Red Block
		{ Foreground = { Color = "#f2f4f8" } },
		{ Text = workspace .. "  " },
		{ Foreground = { Color = "#333333" } },
		{ Text = wezterm.strftime("%H:%M") .. " " },
	}))
end)

-- =========================================================
--  5. KEY BINDINGS (Vim-like Mux)
-- =========================================================
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	-- PANE NAVIGATION (Leader + hjkl)
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },

	-- SPLITTING (Leader + - or \)
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- RESIZING (Leader + r to enter resize mode)
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	-- WORKSPACES (Session Switching)
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{ key = "n", mods = "LEADER", action = act.SwitchToWorkspace },
	{
		key = "$",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for session",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					wezterm.mux.rename_workspace(window:mux_window():get_workspace(), line)
				end
			end),
		}),
	},

	-- CLOSING
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return config
