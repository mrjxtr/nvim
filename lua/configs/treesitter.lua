local options = {
    ensure_installed = {
        "bash",
        "css",
        "go",
        "html",
        "javascript",
        "lua",
        "luadoc",
        "markdown",
        "printf",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        -- "c",
        -- "cmake",
        -- "cpp",
        -- "fish",
        -- "gomod",
        -- "gosum",
        -- "gotmpl",
        -- "gowork",
        -- "haskell",
        -- "make",
        -- "odin",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
