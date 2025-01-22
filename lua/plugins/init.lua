return {

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            view = {
                side = "right",
                width = 35,
            },
            filters = {
                dotfiles = false,
            },
        },
    },

    {
        "Exafunction/codeium.vim",
        event = "BufEnter",
    },

    {
        -- Configure tab behaviour when lsp suggestions are available
        "hrsh7th/nvim-cmp",
        opts = function()
            local cmp = require("cmp")
            local M = require("nvchad.configs.cmp")

            -- Modify default mappings
            M.mapping = {
                -- Disable tab for navigation
                ["<Tab>"] = cmp.config.disable,
                ["<S-Tab>"] = cmp.config.disable,

                -- Use Ctrl+n/p for navigation instead
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),

                -- Keep default Enter behavior for confirmation
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),

                -- Keep default Ctrl+Space for manual trigger
                ["<C-Space>"] = cmp.mapping.complete(),
            }

            return M
        end,
    },
}
