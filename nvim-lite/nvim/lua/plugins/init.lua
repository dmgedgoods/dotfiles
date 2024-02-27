local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
plugins = {
	{ "nvim-lua/plenary.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 100,
		config = true,
		lazy = false,

	},
	{
		'github/copilot.vim'
	},
	{
		'JoosepAlviste/nvim-ts-context-commentstring',
	},
	{
		  'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.oil")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("plugins.indentline")
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = function()
			require("plugins.treesitter")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>" },
			{ "<leader>fp", "<cmd>Telescope projects<cr>" },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>" },
		},
		config = function()
			require("plugins.telescope")
		end,
	},

	-- cmp plugins
	{ "hrsh7th/nvim-cmp" },        -- The completion plugin
	{ "hrsh7th/cmp-buffer" },      -- buffer completions
	{ "hrsh7th/cmp-path" },        -- path completions
	{ "hrsh7th/cmp-cmdline" },     -- cmdline completions
	{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp" },    -- enable lsp autocomplete with cmp
	{ "mfussenegger/nvim-jdtls",
	},

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{ "nvimtools/none-ls.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "williamboman/mason.nvim" },
	{ "jayp0521/mason-nvim-dap.nvim" },
	{ "jayp0521/mason-null-ls.nvim" },
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		keys = {

			{ "<leader>dt", "<cmd>DapToggleBreakpoint<cr>" },
			{ "<leader>dc", "<cmd>DapContinue<cr>" },
			{ "<leader>di", "<cmd>DapStepInto<cr>" },
			{ "<leader>do", "<cmd>DapStepOver<cr>" },
		},
		config = function()
			require("plugins.dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		keys = {
			{ "<leader>du", "<cmd>lua require'dapui'.toggle({reset=true})<cr>" },
		},
		config = function()
			require("plugins.dapui")
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "py",
		event = "VeryLazy",
		config = function()
			require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{ "rafamadriz/friendly-snippets" },


}
require("lazy").setup(plugins, opts)
