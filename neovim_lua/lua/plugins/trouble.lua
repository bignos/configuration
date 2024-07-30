return {
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        cmd = "Trouble",
        keys = {
            -- Toggle Trouble
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                { desc = "Errors all workspace", silent = true, noremap = true },
            },

            -- Toggle Trouble for this buffer only
            {
                "<leader>xb",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                { desc = "Errors only this buffer", silent = true, noremap = true },
            },

            -- Toggle Trouble for Location list
            {
                "<leader>xl",
                "<cmd>Trouble loclist toggle<cr>",
                { desc = "Location list", silent = true, noremap = true },
            },

            -- Toggle Trouble for Quickfix list
            {
                "<leader>xq",
                "<cmd>Trouble qflist toggle<cr>",
                { desc = "quickfix", silent = true, noremap = true },
            },

        },
        init = function()
            require("trouble").setup {}
        end
    }
}
