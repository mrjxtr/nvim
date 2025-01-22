require("nvchad.options")

local o = vim.o

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

-- scrolling
o.scrolloff = 10 -- keep 10 lines below and above cursor

-- lines
-- o.cursorlineopt = "both" -- to enable cursorline!
o.colorcolumn = "80"
o.autoindent = true

o.wrap = false -- don't wrap lines
