local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports-reviser", "golines" },
        python = { "black", "isort" },
        django = { "djlint" },
        jinja = { "djlint" },
        css = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        bash = { "shellharden" },
        -- c = { "clang-format" },
        -- cpp = { "clang-format" },
        -- haskell = { "fourmolu", "stylish-haskell" },
    },

    formatters = {
        -- C & C++
        -- ["clang-format"] = {
        --     prepend_args = {
        --         "-style={ \
        --                 IndentWidth: 4, \
        --                 TabWidth: 4, \
        --                 UseTab: Never, \
        --                 AccessModifierOffset: 0, \
        --                 IndentAccessModifiers: true, \
        --                 PackConstructorInitializers: Never}",
        --     },
        -- },
        --
        -- Golang
        ["goimports-reviser"] = {
            prepend_args = { "-rm-unused" },
        },
        golines = {
            prepend_args = { "--max-len=80" },
        },
        --
        -- Lua
        stylua = {
            prepend_args = {
                "--column-width",
                "80",
                "--line-endings",
                "Unix",
                "--indent-type",
                "Spaces",
                "--indent-width",
                "4",
                "--quote-style",
                "AutoPreferDouble",
            },
        },
        --
        -- Python
        black = {
            prepend_args = {
                "--fast",
                "--line-length",
                "80",
            },
        },
        isort = {
            prepend_args = {
                "--profile",
                "black",
            },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
