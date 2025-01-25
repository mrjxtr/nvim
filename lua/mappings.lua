require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- move lines using shift + j or k
map("n", "<S-j>", ":m .+1<CR>==")
map("n", "<S-k>", ":m .-2<CR>==")
map("i", "<S-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<S-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<S-j>", ":m '>+1<CR>gv=gv")
map("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
