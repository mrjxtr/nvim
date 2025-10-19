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
    event = "VeryLazy",
    opts = {
      auto_reload_on_write = true,
      reload_on_bufenter = true,
      view = {
        cursorline = true,
        side = "right",
        preserve_window_proportions = false,
        number = true,
        relativenumber = true,
        width = {
          min = 35,
          max = 40,
          padding = 1,
        },
      },
      filters = {
        dotfiles = false,
      },
      renderer = {
        root_folder_label = ":~:s?$?/..?",
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

        -- Enable cmp navigation with Up and Down keys
        ["<DOWN>"] = cmp.mapping.select_next_item(),
        ["<UP>"] = cmp.mapping.select_prev_item(),

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
        INFO = { icon = " ", color = "#648CE3", alt = { "i" } },
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
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
    },
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

  -- Debugging Go
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("dap-go").setup()
    end,
  },

  -- Discord Presence
  {
    "vyfor/cord.nvim",
    event = "BufEnter",
    build = ":Cord update",
    config = function()
      require("cord").setup({
        -- Custome Configurations here
        idle = {
          ignore_focus = false,
        },
      })
    end,
  },

  -- Create Code Snapshots
  {
    "mistricky/codesnap.nvim",
    event = "BufEnter",
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

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- CSV Viewing
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },

  -- Surround selections
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- edgy.nvim configuration
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = function()
      return require("configs.edgy")
    end,
  },

  -- Rust LSP config
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = "rust",
    config = function()
      local mason_path = vim.fn.stdpath("data") .. "/mason"
      local extension_path = mason_path .. "/packages/codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      local cfg = require("rustaceanvim.config")

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
  },

  -- Autosave for rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- Crates for rust config
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    tag = "stable",
    config = function()
      require("crates").setup({
        completion = {
          cmp = {
            enabled = true,
          },
        },
      })
      require("cmp").setup.buffer({
        sources = { { name = "crates" } },
      })
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    -- event = "BufEnter",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "classic",
        transparent_bg = true,
        options = {
          show_source = {
            enabled = true,
          },
        },
      })
      vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
    end,
  },
}
