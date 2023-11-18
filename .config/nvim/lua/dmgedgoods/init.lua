require("dmgedgoods.set")
require("dmgedgoods.remap")

local augroup = vim.api.nvim_create_augroup
local dmgedgoodsGroup = augroup('dmgedgoodsGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = dmgedgoodsGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 15

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()
require("oil").setup()
-- OR setup with some options
--require("nvim-tree").setup({
--  sort_by = "case_sensitive",
--  view = {
--    width = 30,
--  },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--   dotfiles = false,
--  },
--})
