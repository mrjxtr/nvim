local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    python = { "ruff" },
    javascript = { "eslint_d" },
    django = { "djlint" },
    angular = { "djlint" },
    jinja = { "djlint" },
    go = { "djlint" },
}

lint.linters.luacheck.args = {
    unpack(lint.linters.luacheck.args),
    "--globals",
    "love",
    "vim",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
