return {
    {
        "ellisonleao/dotenv.nvim",
        enabled = true,
        config = function()
            require("dotenv").setup({
                enable_on_load = true
            })
        end,
    }
}
