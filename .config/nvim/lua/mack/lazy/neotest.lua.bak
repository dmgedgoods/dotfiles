return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-vitest"),
					require("neotest-plenary").setup({
						-- this is my standard location for minimal vim rc
						-- in all my projects
						min_init = "./scripts/tests/minimal.vim",
					}),
				}
			})

			vim.keymap.set("n", "<leader>tc", function()
				neotest.run.run()
			end)
		end,
		keys = {
			-- Run nearest tests
			vim.keymap.set("n", "<leader>R", function()
				require("neotest").run.run()
			end, { desc = "Run nearest tests" }),
			-- Run tests in file
			vim.keymap.set("n", "<leader>F", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end, { desc = "Run tests in file" }),
		}
	},
}
