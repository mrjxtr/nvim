local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "goimports", "golines" },
    python = { "black", "isort" },
    htmldjango = { "djlint" },
    jinja = { "djlint" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    yaml = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    sh = { "shellharden" },
    vue = { "prettier" },
    sql = { "sqlfluff" },
  },

  formatters = {
    -- Python
    black = {
      prepend_args = {
        "--fast",
        "--line-length",
        "88",
      },
    },
    isort = {
      prepend_args = {
        "--profile",
        "black",
      },
    },

    -- Golang
    golines = {
      prepend_args = { "--max-len=88" },
    },

    prettier = {
      prepend_args = {
        "--print-width",
        "88",
        "--tab-width",
        "2",
        "--use-tabs",
        "false",
        "--single-quote",
        "false",
        "--jsx-single-quote",
        "false",
        "--no-semi",
      },
    },

    -- SQL (dialect comes from .sqlfluff config files, see lint.lua)
    sqlfluff = {
      require_cwd = false,
      args = { "fix", "-" },
    },

    -- Lua
    stylua = {
      prepend_args = {
        "--column-width",
        "88",
        "--line-endings",
        "Unix",
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
        "--quote-style",
        "AutoPreferDouble",
      },
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 1000,
  --   -- lsp_format = "never",
  --   lsp_format = "fallback",
  -- },

  format_after_save = {
    -- These options will be passed to conform.format()
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
