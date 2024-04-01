local map = vim.keymap.set

local opts = { noremap = true, silent = true }
local exopts = { expr = true, silent = true }
local fopts = { noremap = false, silent = true }

-- Oil
map("n", "<leader>n", "<cmd>Oil<cr>", opts)

-- Move stuff around
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Clear search, Panic button, etc
map("n", "<esc>", ":nohlsearch<cr>", opts)
map("n", "<esc>", ":noh<cr>", opts)
map("t", "<esc>", [[<C-\><C-n>]], opts)

-- Reconcile split windows (use with Harpoon, yw)
map("n", "<C-o>", "<C-w>o", opts)
map("n", "<leader>vs", ":vsplit<cr>", opts)

-- Format
map("n", "<leader>f", "<cmd>lua .lsp.buf.format({async = true})<cr>", fopts)

-- Resize windows with arrows
map("n", "<C-A-k>", "<cmd> resize +2<CR>", opts)
map("n", "<C-A-j>", "<cmd> resize -2<CR>", opts)
map("n", "<C-A-l>", "<cmd> vertical resize -2<CR>", opts)
map("n", "<C-A-h>", "<cmd> vertical resize +2<CR>", opts)

-- Move between windows
map({ "n", "t" }, "<C-h>", "<C-w>h", opts)
map({ "n", "t" }, "<C-j>", "<C-w>j", opts)
map({ "n", "t" }, "<C-k>", "<C-w>k", opts)
map({ "n", "t" }, "<C-l>", "<C-w>l", opts)

-- Visual mode mappings
map("v", "<", "<gv", opts)  -- unindent lines
map("v", ">", ">gv", opts)  -- indent lines
map("v", "p", "_dP", fopts) --"paste"  in visual mode replace selected text with the yanked text

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

-- Hmmmmm
map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")
-- map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<leader>f", vim.lsp.buf.format)

map("n", "<C-.>", "<cmd>cnext<CR>zz")
map("n", "<C-,>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("n", "<leader>op", "<cmd>e ~/.config/nvim/lua/mack/options.lua<CR>");

