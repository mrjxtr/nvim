local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- local lspconfig = require("lspconfig") -- pre nvim 0.11
local lspconfig = require("nvchad.configs.lspconfig") -- nvim 0.11

-- list of all servers configured.
lspconfig.servers = {
  "lua_ls",
  "pyright",
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
  "rust_analyzer",
  "vue_ls",
  "markdown_oxide",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  -- lspconfig[lsp].setup({
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

-- lspconfig.eslint.setup({ -- pre nvim 0.11
vim.lsp.config("eslint", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
})

-- lspconfig.ts_ls.setup({ -- pre nvim 0.11
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  -- filetypes = { "typescript" },

  init_options = {
    preferences = {
      disableSuggestions = true,
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

-- lspconfig.tailwindcss.setup({ -- pre nvim 0.11
vim.lsp.config("tailwindcss", {
  filetypes = {
    "django - html",
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
