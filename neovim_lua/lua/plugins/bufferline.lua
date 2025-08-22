return {
    {
        "akinsho/bufferline.nvim",
        dependencies =  { "nvim-tree/nvim-web-devicons", opt = true },
        init = function()
            require("bufferline").setup{}
        end
    }
}
