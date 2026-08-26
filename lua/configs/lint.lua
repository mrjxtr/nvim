local lint = require("lint")

-- NOTE: js/ts linting comes from the eslint LSP (only attaches in projects
-- with an eslint config); eslint_d here would duplicate every finding
lint.linters_by_ft = {
  lua = { "luacheck" },
  -- python = { "ruff" },
  htmldjango = { "djlint" },
  jinja = { "djlint" },
  sql = { "sqlfluff" },
}

lint.linters.luacheck.args = {
  -- unpack(lint.linters.luacheck.args),
  "--globals",
  "love",
  "vim",
  "--formatter",
  "plain",
  "--codes",
  "--ranges",
  "-",
}

-- dialect and rule tweaks come from sqlfluff config files: per-repo .sqlfluff
-- when present, else the fallback in ~/.config/sqlfluff/.sqlfluff (postgres)
lint.linters.sqlfluff.args = {
  "lint",
  "--format=json",
  "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})
