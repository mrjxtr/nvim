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

                -- Use Ctrl+j/k for navigation instead
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),

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

    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "#DB6969", -- can be a hex color, or a named color (see below)
                    alt = { "BUG", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = " ", color = "#FFC369" },
                INFO = { icon = " ", color = "#648CE3", alt = { " " } },
                NOTE = { icon = " ", color = "#52BA88" },
            },
        },
    },

    {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup()
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        event = "BufEnter",
        opts = function()
            local actions = require("telescope.actions")

            return {
                defaults = {
                    layout_config = {
                        prompt_position = "top",
                    },
                    sorting_strategy = "ascending",
                    mappings = {
                        i = {
                            -- Disable default j/k mappings
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,

                            -- Disable the default <C-n>/<C-p> mappings
                            ["<C-n>"] = false,
                            ["<C-p>"] = false,
                        },
                    },
                },
            }
        end,
    },
}
