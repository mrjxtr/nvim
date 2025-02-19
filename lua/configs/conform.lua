local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports", "golines" },
        python = { "black", "isort" },
        django = { "djlint" },
        jinja = { "djlint" },
        css = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        bash = { "shellharden" },
    },

    formatters = {
        -- Golang
        golines = {
            prepend_args = { "--max-len=100" },
        },

        -- Lua
        stylua = {
            prepend_args = {
                "--column-width",
                "100",
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

        -- Python
        black = {
            prepend_args = {
                "--fast",
                "--line-length",
                "100",
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
