require("settings")
require("mappings")
require("plugins")
require("lsp")

--vim.cmd("let g:gruvbox_transparent_bg = 1")
vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
vim.cmd.colorscheme("gruvbox")
