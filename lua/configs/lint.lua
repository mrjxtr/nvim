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

lint.linters.sqlfluff.args = {
  "lint",
  "--format=json",
  "--dialect=postgres",
  "--exclude-rules=AM04",
  "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})
