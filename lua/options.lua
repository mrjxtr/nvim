require("nvchad.options")
local o = vim.o
local opt = vim.opt

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.autoindent = true
o.smartindent = true

-- scrolling
o.scrolloff = 10 -- keep 10 lines below and above cursor

-- lines
-- o.cursorlineopt = "both" -- to enable cursor line

opt.colorcolumn = { 80, 88 }
o.autoindent = true

o.wrap = false -- don't wrap lines
o.swapfile = false -- don't need swap files

-- Disable codeium by default
vim.g.codeium_enabled = false

-- Custom tabstop and shiftwidth for specific files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "python", "go" },
    command = "setlocal shiftwidth=4 tabstop=4",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "javascript", "typescript", "json", "jsonc" },
    command = "setlocal shiftwidth=2 tabstop=2",
})
