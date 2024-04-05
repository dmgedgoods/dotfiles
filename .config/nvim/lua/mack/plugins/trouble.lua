return {
	"folke/trouble.nvim",
	cmd = {
		"TroubleToggle",
		"Trouble",
		"TroubleRefresh",
		"TroubleClose",
	},
	dependencies = "nvim-tree/nvim-web-devicons",
	keys = {
		-- { "<F5>", "<cmd>TroubleClose<cr>", noremap = true },
		-- { "<F6>", "<cmd>Trouble workspace_diagnostics<cr>", noremap = true },
		{ "<leader>xx", "<cmd>TroubleToggle<cr>", noremap = true, desc = "Trouble toggle" },
		{
			"<leader>xw",
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			noremap = true,
			desc = "Trouble workspace diagnostics",
		},
		{
			"<leader>xd",
			"<cmd>TroubleToggle document_diagnostics<cr>",
			noremap = true,
			desc = "Trouble document diagnostics",
		},
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", noremap = true, desc = "Trouble loclist" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", noremap = true, desc = "Trouble quickfix" },
		{ "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", noremap = true, desc = "Trouble lsp references" },
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

