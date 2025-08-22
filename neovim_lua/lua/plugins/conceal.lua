return {
    {
        "Jxstxs/conceal.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        keys = {
            {
                "<leader>Yc",
                function() require("conceal").toggle_conceal() end,
                desc = "Conceal",
            }
        }
    }
}
