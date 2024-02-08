local vim = vim
local opt = vim.opt

opt.foldenable = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "rust" }, -- one of "all" or a list of languages
    ignore_install = { "" },                                           -- List of parsers to ignore installing
    highlight = {
        enable = true,                                                 -- false will disable the whole extension
        disable = { "css" },                                           -- list of language that will be disabled
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },
})