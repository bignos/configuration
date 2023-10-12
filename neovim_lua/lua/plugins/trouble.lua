return {
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        keys = {
            -- Toggle Trouble
            {
                "<leader>xx",
                "<cmd>TroubleToggle document_diagnostics<cr>",
                { desc = "Errors all workspace", silent = true, noremap = true },
            },

            -- Toggle Trouble for this buffer only
            {
                "<leader>xb",
                "<cmd>TroubleToggle document_diagnostics<cr>",
                { desc = "Errors only this buffer", silent = true, noremap = true },
            },

            -- Toggle Trouble for Location list
            {
                "<leader>xl",
                "<cmd>TroubleToggle loclist<cr>",
                { desc = "Location list", silent = true, noremap = true },
            },

            -- Toggle Trouble for Quickfix list
            {
                "<leader>xq",
                "<cmd>TroubleToggle quickfix<cr>",
                { desc = "quickfix", silent = true, noremap = true },
            },

        },
        init = function()
            require("trouble").setup {}
        end
    }
}
