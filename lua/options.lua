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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "go",
    "lua",
    "html",
    "htmldjango",
    "templ",
    "css",
    "javascript",
    "typescript",
    "json",
    "jsonc",
    "tsx",
    "jsx",
    "cpp",
    "c",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})
