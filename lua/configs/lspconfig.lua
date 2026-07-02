local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- local lspconfig = require("lspconfig") -- pre nvim 0.11
local lspconfig = require("nvchad.configs.lspconfig") -- nvim 0.11

-- NvChad's defaults() turns native virtual text on, disable it here (this file
-- runs right after defaults()) so tiny-inline-diagnostic is the only renderer,
-- regardless of whether files open before or after VeryLazy
vim.diagnostic.config({ virtual_text = false })

-- list of all servers configured.
lspconfig.servers = {
  "lua_ls",
  "pyright",
  "ruff", -- lint diagnostics for python (pyright's are suppressed below)
  "gopls",
  "ts_ls",
  "eslint",
  "tailwindcss",
}

-- list of servers configured with default config.
local default_servers = {
  "cssls",
  "html",
  "djlsp",
  "bashls",
  "clangd",
  -- "htmx", -- NOTE: Uncomment if HTMX is needed
  "templ",
  "dockerls",
  -- "rust_analyzer" is intentionally not here, rustaceanvim manages it
  "vue_ls",
  "markdown_oxide",
  "zls",
  "sqls",
}

-- mason installs everything in both lists (rust_analyzer is rustaceanvim's
-- job, denols uses the system deno, so neither belongs here)
vim.list_extend(lspconfig.servers, default_servers)

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  -- lspconfig[lsp].setup({
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

-- denols uses the system deno binary (not a mason package), so
-- mason-lspconfig's automatic_enable never picks it up, enable manually.
-- Only attaches in deno projects (deno.json/deno.jsonc root); ts_ls
-- already excludes those, so they never overlap.
vim.lsp.config("denols", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
})

-- enable every configured server explicitly; without this, servers only
-- start because mason-lspconfig auto-enables installed mason packages,
-- which silently breaks on a fresh machine (or for non-mason servers
-- like denols)
vim.lsp.enable(lspconfig.servers)
vim.lsp.enable("denols")

-- lspconfig.eslint.setup({ -- pre nvim 0.11
vim.lsp.config("eslint", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
})

-- vue_ls v3 only handles the template side of .vue files; TS intelligence
-- (even inside .vue) comes from ts_ls via @vue/typescript-plugin below.
-- hybridMode was removed in v3, and takeover of plain ts/js files is gone.
vim.lsp.config("vue_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "vue" },
})

-- lspconfig.ts_ls.setup({ -- pre nvim 0.11
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  -- filetypes = { "typescript" },
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },

  init_options = {
    preferences = {
      disableSuggestions = true,
    },
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath("data")
          .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
})

vim.lsp.config("pyright", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
        -- typeCheckingMode = "off", -- Disable type checking diagnostics
      },
    },
  },
})

-- lspconfig.gopls.setup({ -- pre nvim 0.11
vim.lsp.config("gopls", { -- nvim 0.11
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl", "gowork" },
  -- root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"), -- pre nvim 0.11
  -- root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"), -- nvim 0.11
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        ST1000 = false, -- don't require package doc comments at the top
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
})

-- lspconfig.lua_ls.setup({ -- pre nvim 0.11
vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        enable = false, -- Disable all diagnostics from lua_ls
        -- globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/love2d/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

-- upstream default includes plain "html", which attaches djlsp to every
-- html file; only want it on actual template files
vim.lsp.config("djlsp", {
  filetypes = { "htmldjango", "jinja" },
})

vim.lsp.config("cssls", {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
})

-- lspconfig.tailwindcss.setup({ -- pre nvim 0.11
vim.lsp.config("tailwindcss", {
  filetypes = {
    "django-html",
    "htmldjango",
    "gohtml",
    "gohtmltmpl",
    "html",
    "css",
    "less",
    "postcss",
    "sass",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "templ",
  },
  settings = {
    editor = {
      tabSize = 2,
    },
  },
})
