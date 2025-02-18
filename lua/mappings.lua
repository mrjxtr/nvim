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

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle({
        pos = "float",
        id = "floatTerm",
        float_opts = {
            row = 0.2,
            col = 0.2,
            width = 0.6,
            height = 0.60,
        },
    })
end, { desc = "terminal toggle floating term" })

map({ "n", "t" }, "<A-v>", function()
    require("nvchad.term").toggle({
        pos = "vsp",
        id = "vertTerm",
        size = 0.4,
    })
end, { desc = "terminal toggle vertical term" })

map({ "n", "t" }, "<A-h>", function()
    require("nvchad.term").toggle({
        pos = "sp",
        id = "vertTerm",
        size = 0.4,
    })
end, { desc = "terminal toggle vertical term" })
