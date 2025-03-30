-- edgy.nvim configuration

return {
    -- Disable animations
    animate = {
        enabled = false,
        fps = 100,
        cps = 120,
    },

    -- Left sidebar for DAP UI elements
    left = {
        {
            ft = "dapui_scopes",
            title = "VARIABLES",
            size = { width = 0.20, height = 0.70 },
            pinned = true,
        },
        {
            ft = "dapui_watches",
            title = "WATCH",
            size = { width = 0.20, height = 0.10 },
            pinned = true,
            collapsed = true,
        },
        {
            ft = "dapui_stacks",
            title = "CALL STACK",
            size = { width = 0.20, height = 0.10 },
            pinned = true,
            collapsed = true,
        },
        {
            ft = "dapui_breakpoints",
            title = "BREAKPOINTS",
            size = { width = 0.20, height = 0.10 },
            pinned = true,
        },
    },

    -- Bottom panel for REPL and Console
    bottom = {
        {
            ft = "dapui_console",
            title = "CONSOLE",
            size = { width = 0.80, height = 0.25 },
            pinned = true,
        },
        {
            ft = "dap-repl",
            title = "REPL",
            size = { width = 0.20, height = 0.25 },
            pinned = true,
        },
    },
}
