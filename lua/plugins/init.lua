return {

    -- Syntax Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    -- LSP Configuration
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    -- Linter
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    -- Linter
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    -- Formatter
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    -- Formatter
    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },

    -- File Explorer
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
            git = {
                enable = true,
                ignore = false,
            },
        },
    },

    -- Keybindings
    {
        "folke/which-key.nvim",
        event = "BufEnter",
    },

    -- AI Assistant
    {
        "Exafunction/codeium.vim",
        event = "BufEnter",
    },

    -- Code Completion
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

    -- Comment Highlighting
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

    -- Fuzzy Finder
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

    -- Debugging Adapter Protocol
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("configs.dap")
        end,
    },

    -- Async IO in Nvim
    {
        "nvim-neotest/nvim-nio",
    },

    -- Debugging UI
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require("configs.dap-ui")
        end,
    },

    -- Debugging Python
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            require("configs.dap-python")
        end,
    },

    -- Debugging
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        config = function()
            require("configs.mason-dap")
        end,
    },

    -- Discord Presence
    {
        "vyfor/cord.nvim",
        event = "BufEnter",
        build = ":Cord update",
        config = function()
            require("cord").setup({
                display = {
                    theme = "pastel",
                },
                timestamp = {
                    reset_on_idle = false,
                    reset_on_change = false,
                },
            })
        end,
    },

    -- Create Code Snapshots
    {
        "mistricky/codesnap.nvim",
        build = "make",
        keys = {
            {
                "<leader>cc",
                "<cmd>CodeSnap<cr>",
                mode = "x",
                desc = "Save selected code snapshot into clipboard",
            },
            {
                "<leader>cs",
                "<cmd>CodeSnapSave<cr>",
                mode = "x",
                desc = "Save selected code snapshot in ~/Pictures/screenshots/",
            },
            {
                "<leader>ch",
                "<cmd>CodeSnapHighlight<cr>",
                mode = "x",
                desc = "Save selected code snapshot into clipboard",
            },
            {
                "<leader>ci",
                "<cmd>CodeSnapASCII<cr>",
                mode = "x",
                desc = "Save selected code snapshot into clipboard",
            },
        },
        opts = {
            code_font_family = "JetBrainsMono Nerd Font",
            save_path = "~/Pictures/screenshots/",
            has_line_number = true,
            has_breadcrumbs = true,
            bg_color = "#535c68",
            bg_x_padding = 60,
            bg_y_padding = 60,
            bg_padding = nil,
            watermark = "",
        },
    },
}
