return {
    {
        "Jxstxs/conceal.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        keys = {
            {
                "<leader>c",
                function() require("conceal").toggle_conceal() end,
                desc = "Conceal",
            }
        }
    }
}
