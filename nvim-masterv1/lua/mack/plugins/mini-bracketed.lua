return {
	"echasnovski/mini.bracketed",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		buffer = { suffix = "", options = {} },
		comment = { suffix = "k", options = {} },
		conflict = { suffix = "x", options = {} },
		diagnostic = { suffix = "d", options = {} },
		file = { suffix = "f", options = {} },
		indent = { suffix = "i", options = {} },
		jump = { suffix = "j", options = {} },
		location = { suffix = "l", options = {} },
		oldfile = { suffix = "o", options = {} },
		quickfix = { suffix = "q", options = {} },
		treesitter = { suffix = "t", options = {} },
		undo = { suffix = "" },
		window = { suffix = "w", options = {} },
		yank = { suffix = "y", options = {} },
	},
}
