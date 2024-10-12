return {
	"folke/trouble.nvim",
	cmd = {
		"Trouble",
		"TroubleRefresh",
		"TroubleClose",
	},
	dependencies = "nvim-tree/nvim-web-devicons",
	keys = {
		-- { "<F5>", "<cmd>TroubleClose<cr>", noremap = true },
		-- { "<F6>", "<cmd>Trouble workspace_diagnostics<cr>", noremap = true },
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", noremap = true, desc = "Trouble toggle" },
		{
			"<leader>xw",
			"<cmd>Trouble workspace_diagnostics toggle<cr>",
			noremap = true,
			desc = "Trouble workspace diagnostics toggle",
		},
		{
			"<leader>xd",
			"<cmd>Trouble document_diagnostics toggle<cr>",
			noremap = true,
			desc = "Trouble document diagnostics",
		},
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", noremap = true, desc = "Trouble loclist" },
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", noremap = true, desc = "Trouble quickfix" },
		{ "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", noremap = true, desc = "Trouble lsp references" },
	},
	opts = {
		fold_open = "",
		fold_closed = "",
		action_keys = {
			open_split = { "<c-s>" },
			open_vsplit = { "<c-v>" },
			open_tab = { "<c-t>" },
		},
		use_diagnostic_signs = true,
	},
}

