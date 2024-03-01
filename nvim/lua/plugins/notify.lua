local icons = require("icons")

vim.notify = require("notify")

require("notify").setup({
	-- Animation style (see below for details)
	stages = "fade",

	-- Function called when a new window is opened, use for changing win settings/config
	on_open = nil,

	-- Function called when a window is closed
	on_close = nil,

	-- Render function for notifications. See notify-render()
	render = "minimal",

	-- Default timeout for notifications
	timeout = 1000,

	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group or an RGB hex value e.g. "#000000"
	background_colour = "#000000",

	-- Minimum width for notification windows
	minimum_width = 10,

	-- Icons for the different levels
	icons = {
		ERROR = icons.diagnostics.Error,
		WARN = icons.diagnostics.Warning,
		INFO = icons.diagnostics.Information,
		DEBUG = icons.ui.Bug,
		TRACE = icons.ui.Pencil,
	},
})

local notify_filter = vim.notify
vim.notify = function(msg, ...)
	if msg:match("character_offset must be called") then
		return
	end
	if msg:match("method textDocument") then
		return
	end

	notify_filter(msg, ...)
end
