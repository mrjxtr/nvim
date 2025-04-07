local options = {
  ensure_installed = {
    "bash",
    "css",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "gowork",
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
    "make",
    -- "fish",
    -- "haskell",
    -- "odin",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
