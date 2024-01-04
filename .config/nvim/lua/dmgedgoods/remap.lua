--Leader stuff
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", "<CMD>Oil --float<CR>)")

-- CWD just in case
vim.keymap.set("n", "<leader>cd", [[:cd %:p:h<CR>:pwd<CR>]] )

-- Basic Movement between splits
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- move lines around in Visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- join lines in normal mode
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- reset colorscheem
vim.keymap.set("n", "<leader>rr", "<cmd>lua ColorMyPencils('gruvbox')<CR><CMD>so ~/.config/nvim/lua/dmgedgoods/remap.lua<CR>) ")

-- greatest remap ever
vim.keymap.set("v", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Format current buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Nav compile and lint issues
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- quick replace (magic)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/AppData/nvim/lua/dmgedgoods/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Git stuff
vim.keymap.set("n", "<leader>ga", "<cmd>Git add --all<CR>");
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit -m 'quick update'<CR>");
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>");
vim.keymap.set("n", "<leader>gm", "<cmd>Git pull<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
