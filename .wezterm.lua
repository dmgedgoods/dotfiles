local wezterm = require("wezterm")
local act = wezterm.action
--local config = wezterm.config_builder()
local ssh_connections = dofile(wezterm.config_dir .. "/ssh_connections.lua")
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- Construct the tab title
	local tab_title_text = string.format("[%d] %s ", tab.tab_index + 1, tab_title(tab))

	-- Return the formatted tab with colors
	return {
		{ Text = tab_title_text },
	}
end)
--wezterm.on(
--    'format-tab-title',
--    function(tab, tabs, panes, config, hover, max_width)
--        --local edge_background = '#0b0022'
--        --local background = '#1d2021'
--        --local foreground = '#a89984'
--        --if tab.is_active then
--        --    background = '#3c3836'
--        --    foreground = '#fbf1c7'
--        --elseif hover then
--        --    background = '#1d2021'
--        --    foreground = '#ebdbb2'
--        --end
--        local edge_background = '#191724' -- Rose Pine Base
--        local background = '#1f1d2e'      -- Rose Pine Surface
--        local foreground = '#e0def4'      -- Rose Pine Text
--
--        if tab.is_active then
--            background = '#403d52' -- Rose Pine Highlight Med
--            foreground = '#e0def4' -- Rose Pine Text
--        elseif hover then
--            background = '#26233a' -- Rose Pine Overlay
--            foreground = '#908caa' -- Rose Pine Subtle
--        end
--
--        local edge_foreground = background
--        local title = tab_title(tab)
--        title = wezterm.truncate_right(title, max_width - 2)
--
--        return {
--            { Background = { Color = edge_background } },
--            { Foreground = { Color = edge_foreground } },
--            { Text = SOLID_LEFT_ARROW },
--            { Background = { Color = background } },
--            { Foreground = { Color = foreground } },
--            { Text = title },
--            { Background = { Color = edge_background } },
--            { Foreground = { Color = edge_foreground } },
--            { Text = SOLID_RIGHT_ARROW },
--        }
--    end
--)

return {
	font_size = 14.0,
	font = wezterm.font("Hack Nerd Font Mono", { weight = "Medium", style = "Normal" }),
	--wezterm.font("Monoid Nerd Font", {weight="DemiBold", stretch="Normal", style="Oblique"}),
	--wezterm.font("Terminess Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	--wezterm.font("Iosevka Nerd Font", { weight = "Bold", stretch = "Normal", style = "Oblique" }),
	--wezterm.font("Iosevka Nerd Font", {weight="Medium", stretch="Normal", style="Normal"}),
	--wezterm.font("JetBrainsMonoNL Nerd Font", {weight="Medium", stretch="Normal", style="Oblique"}),
	--color_scheme = 'Rosé Pine (base16)',
	color_scheme = "rose-pine",
	--color_scheme = 'Tokyo Night',
	audible_bell = "Disabled",
	hide_tab_bar_if_only_one_tab = true,
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	enable_scroll_bar = false,
	tab_bar_at_bottom = true,
	term = "xterm-256color",
	--term = 'wezterm',
	window_background_opacity = 0.90,
	text_background_opacity = 0.85,
	window_decorations = "RESIZE",
	--background = "#000000",
	colors = {
		background = "black",
		tab_bar = {
			background = "black",
			active_tab = {
				bg_color = "black",
				fg_color = "#fbf1c7",
				intensity = "Bold",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = "black",
				fg_color = "#fbf1c7",
			},
			new_tab = {
				bg_color = "black",
				fg_color = "#fbf1c7",
			},
		},
	},

	leader = { key = "\\", mods = "NONE" },
	keys = {
		{ key = "LeftArrow", mods = "OPT", action = act.SendString("\x1bb") },
		{ key = "RightArrow", mods = "OPT", action = act.SendString("\x1bf") },

		-- The physical CMD key on OSX is the Alt key on Win/*nix, so map the common Alt-combo commands.
		{ key = ".", mods = "CMD", action = act.SendString("\x1b.") },
		{ key = "p", mods = "CMD", action = act.SendString("\x1bp") },
		{ key = "n", mods = "CMD", action = act.SendString("\x1bn") },
		{ key = "b", mods = "CMD", action = act.SendString("\x1bb") },
		{ key = "f", mods = "CMD", action = act.SendString("\x1bf") },

		-- Window management
		{ key = "a", mods = "LEADER", action = act({ SendString = "\\" }) },
		{ key = "-", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "=", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{
			key = "r",
			mods = "LEADER",
			action = act({
				PromptInputLine = {
					description = "Enter a new name",
					action = wezterm.action_callback(function(window, pane, line)
						if line then
							window:active_tab():set_title(line)
						end
					end),
				},
			}),
		},

		{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },

		{ key = "H", mods = "LEADER", action = act({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "J", mods = "LEADER", action = act({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "LEADER", action = act({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "LEADER", action = act({ AdjustPaneSize = { "Right", 5 } }) },

		{ key = "`", mods = "LEADER", action = act.ActivateLastTab },
		{ key = " ", mods = "LEADER", action = act.ActivateTabRelative(1) },
		{ key = "1", mods = "CTRL", action = act({ ActivateTab = 0 }) },
		{ key = "2", mods = "CTRL", action = act({ ActivateTab = 1 }) },
		{ key = "3", mods = "CTRL", action = act({ ActivateTab = 2 }) },
		{ key = "4", mods = "CTRL", action = act({ ActivateTab = 3 }) },
		{ key = "5", mods = "CTRL", action = act({ ActivateTab = 4 }) },
		{ key = "6", mods = "CTRL", action = act({ ActivateTab = 5 }) },
		{ key = "7", mods = "CTRL", action = act({ ActivateTab = 6 }) },
		{ key = "8", mods = "CTRL", action = act({ ActivateTab = 7 }) },
		{ key = "9", mods = "CTRL", action = act({ ActivateTab = 8 }) },
		{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },

		-- Activate Copy Mode
		{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
		-- Paste from Copy Mode
		{ key = "]", mods = "LEADER", action = act.PasteFrom("PrimarySelection") },
	},

	key_tables = {
		-- added new shortcuts to the end
		copy_mode = {
			{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "g", mods = "CTRL", action = act.CopyMode("Close") },
			{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
			{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },

			{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },

			{ key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
			{ key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
			{ key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
			{ key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },

			{ key = "RightArrow", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
			{ key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
			{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },

			{ key = "LeftArrow", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "Tab", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
			{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },

			{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
			{ key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },

			{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
			{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
			{ key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },

			{ key = " ", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
			{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
			{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },

			{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
			{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },

			{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
			{ key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
			{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
			{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
			{ key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },

			{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
			{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
			{ key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },

			{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
			{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },

			{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
			{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },

			-- Enter y to copy and quit the copy mode.
			{
				key = "y",
				mods = "NONE",
				action = act.Multiple({
					act.CopyTo("ClipboardAndPrimarySelection"),
					act.CopyMode("Close"),
				}),
			},
			-- Enter search mode to edit the pattern.
			-- When the search pattern is an empty string the existing pattern is preserved
			{ key = "/", mods = "NONE", action = act({ Search = { CaseSensitiveString = "" } }) },
			{ key = "?", mods = "NONE", action = act({ Search = { CaseInSensitiveString = "" } }) },
			{ key = "n", mods = "CTRL", action = act({ CopyMode = "NextMatch" }) },
			{ key = "p", mods = "CTRL", action = act({ CopyMode = "PriorMatch" }) },
		},

		search_mode = {
			{ key = "Escape", mods = "NONE", action = act({ CopyMode = "Close" }) },
			-- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
			-- to navigate search results without conflicting with typing into the search area.
			{ key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
			{ key = "c", mods = "CTRL", action = "ActivateCopyMode" },
			{ key = "n", mods = "CTRL", action = act({ CopyMode = "NextMatch" }) },
			{ key = "p", mods = "CTRL", action = act({ CopyMode = "PriorMatch" }) },
			{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
			{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
		},
	},
}
