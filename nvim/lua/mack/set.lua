local opt = vim.opt
local o = vim.o
local g = vim.g

o.background = "dark"
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

g.compatible = 0
opt.termguicolors = true

g.tex_flavor = 'latex'
g.tex_conceal = 'abdmg'
opt.mouse = "a"
opt.syntax = "on"
opt.cmdheight = 1
opt.signcolumn = "yes"
opt.laststatus = 3
opt.showcmd = true
opt.cursorline = false
opt.cursorcolumn = false
opt.number = true
opt.relativenumber = true
--o.pumheight = 10
opt.swapfile = false
opt.undofile = true


o.matchpairs = vim.o.matchpairs .. ",<:>"

opt.fillchars = {
	vert = "│",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─ ╱
	msgsep = "‾",
	fold = " ",
	foldopen = "▼",
	-- foldsep = "│",
	foldsep = " ",
	foldclose = "▶",
}

opt.virtualedit = { "block", "onemore" }
opt.wrap = false
opt.linebreak = true
 opt.textwidth = 0
-- opt.wrapmargin =40
opt.scrolloff = 8
opt.sidescrolloff = 40
opt.history = 2000
opt.ttimeoutlen = 0
opt.belloff = "all"
opt.conceallevel = 1
opt.updatetime = 50
opt.wildmenu = true
opt.scrollback = 2000

o.whichwrap = vim.o.whichwrap .. "<,>,h,l"
o.splitkeep = "screen"
opt.colorcolumn = "120"
-- opt.spell = true
-- opt.spelllang = { 'en_us' }
opt.completeopt = { "menu", "menuone", "noselect" }

-- buffer settings
opt.autoread = true
opt.confirm = false
opt.hidden = true

-- coding settings
opt.encoding = "utf-8"


-- indentation & format settings
opt.autoindent = true
opt.smartindent = true
opt.cindent = true
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = -1
opt.shiftwidth = 0
opt.cinoptions = "g0,(0,l1,n-2"
opt.backspace = { "indent", "eol", "start" }

-- hearch settings
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.gp = "rg"

g.html_indent_autotags = "html,head,body"
g.markdown_recommended_style = 0

