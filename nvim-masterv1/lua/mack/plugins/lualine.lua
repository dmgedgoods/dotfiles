﻿local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	enabled = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"Isrothy/lualine-diagnostic-message",
		"meuter/lualine-so-fancy.nvim",
	},
}

local function tab_size()
	return (vim.bo.expandtab and "␠" or "␉") .. vim.bo.tabstop
end

local function codeium()
	local str = vim.fn["codeium#GetStatusString"]()
	if type(str) ~= "string" then
		return ""
	end
	return "{…}" .. vim.fn["codeium#GetStatusString"]()
end

---- Truncating components in smaller window
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
	return function(str)
		local win_width = vim.fn.winwidth(0)
		if hide_width and win_width < hide_width then
			return ""
		elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
			return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
		end
		return str
	end
end

--- Using external source for diff
local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

M.config = function()

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "gruvbox",
			-- component_separators = { left = '╲', right = '╱' },
			component_separators = "",
			-- section_separators = { left = "", right = "" },
			section_separators = "",
			disabled_filetypes = {
				statusline = {
					"dashboard",
					"alpha",
				},
				winbar = {
					"neo-tree",
					"aerial",
					"packer",
					"alpha",
					"dap-repl",
					"dapui_watches",
					"dapui_stacks",
					"dapui_breakpoints",
					"dapui_scopes",
					"dapui_colsoles",
					"",
				},
			},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			--lualine_a = {
			--	{ "mode", fmt = trunc(80, 4, nil, true) },
			--	{
			--		require("noice").api.statusline.command.get,
			--		cond = require("noice").api.statusline.command.has,
			--	},
			--	{
			--		"fancy_macro",
			--		icon = {
			--			"⏺",
			--			color = { fg = c.polar_night.origin },
			--		},
			--	},
			--},
			lualine_a = {
				{
					"b:gitsigns_head",
					icon = "",
				},
				{
					"diff",
					source = diff_source,
					colored = true,
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
				},
			},
			lualine_c = {
				-- { require("NeoComposer.ui").status_recording },
				{
					"filename",
					file_status = true,
					newfile_status = true,
					symbols = {
						modified = "[+]", -- Text to show when the file is modified.
						readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
						unnamed = "[UNNAMED]", -- Text to show for unnamed buffers.
						newfile = "[New]",
					},
					fmt = trunc(90, 30, 50),
					path = 0,
				},
				{
					"diagnostic-message",
					icons = {
						error = " ",
						warn = " ",
						hint = " ",
						info = " ",
					},
				},
			},
			lualine_x = {
				-- mixed_indent,
				-- trailing_whitespace,
				tab_size,
				"encoding",
				{
					"fileformat",
					icons_enabled = true,
					symbols = {
						unix = " LF",
						dos = " CRLF",
						mac = " CR",
					},
				},
			},
			lualine_y = {
				"fancy_filetype",
				"fancy_lsp_servers",
				codeium,
			},
			lualine_z = {
				{
					"fancy_searchcount",
					icon = { "󰱽", color = { fg = '#b8bb26' } },
				},
				{
					"selectioncount",
				},
				{
					"fancy_location",
					icon = {
						"󰍒",
						color = { fg = '#b8bb26' },
						align = "right",
					},
				},
				"filesize",
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{
					"aerial",
					sep = " ⟩ ",
					sep_prefix = true,
					sep_highlight = "@text",
					depth = nil,
					dense = false,
					dense_sep = ".",
					colored = true,
				},
			},
			lualine_x = {
				{
					"diagnostics",
					update_in_insert = true,
					symbols = {
						error = " ",
						warn = " ",
						hint = " ",
						info = " ",
					},
				},
			},
			lualine_y = {
				{ "filetype", icon_only = true },
				{ "filename", fmt = trunc(90, 30, 50), path = 1 },
			},
			lualine_z = {},
		},

		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {
				{ "filetype", icon_only = true },
				{ "filename", fmt = trunc(90, 30, 50), path = 1 },
			},
			lualine_z = {},
		},
		tabline = {},
		extensions = {
			"aerial",
			"toggleterm",
			"lazy",
			"neo-tree",
			"trouble",
			"quickfix",
		},
	})
end

return M
