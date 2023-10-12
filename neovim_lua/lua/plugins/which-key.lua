return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function(_, _)
            vim.o.timeout = true
            vim.o.timeoutlen = 500

            local wk = require("which-key")
            wk.setup({
                plugins = {
                    spelling = {
                        enabled = true
                    },
                },
                window = {
                    border = "single",
                },
            })
            local keymaps = {
                mode = { "n", "v" },
                f = { name = ">Find" },
                g = { name = ">Git" },
                v = { name = ">Code" },
                r = { name = ">Refactor" },
                x = { name = ">Trouble" },
                M = { name = ">BookMacro" },
            }
            wk.register(keymaps, { prefix = "<leader>" })
        end,
    },
}
