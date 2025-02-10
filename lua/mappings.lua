require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- move lines using shift + j or k
map("n", "<S-j>", ":m .+1<CR>==")
map("n", "<S-k>", ":m .-2<CR>==")
map("v", "<S-j>", ":m '>+1<CR>gv=gv")
map("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- mappings for continuous indent/outdent in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Enable/Disable Codeium
map(
    { "n", "v" },
    "<C-c>",
    "<cmd> CodeiumEnable <cr>",
    { desc = "Enable Codeium" }
)
map(
    { "n", "v" },
    "<C-c-d>",
    "<cmd> CodeiumDisable <cr>",
    { desc = "Disable Codeium" }
)

-- Find all TODOs
map(
    "n",
    "<leader>ft",
    "<cmd> TodoTelescope keywords=FIX,TODO,INFO,NOTE <cr>",
    { desc = "Find TODOs" }
)

-- Show function tooltip
map(
    "n",
    "gh",
    "<cmd>lua vim.lsp.buf.hover()<cr>",
    { desc = "Show function tooltip" }
)
