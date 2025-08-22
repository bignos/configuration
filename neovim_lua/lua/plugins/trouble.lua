return {
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        cmd = "Trouble",
        keys = {
            -- Toggle Trouble
            {
                "<leader>CD",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics all workspace",
            },

            -- Toggle Trouble for this buffer only
            {
                "<leader>Cd",
                "<cmd>Trouble diagnostics toggle filter.buf=1<cr>",
                desc = "Diagnostics only this buffer",
            },

        },
        init = function()
            require("trouble").setup {}
        end
    }
}
