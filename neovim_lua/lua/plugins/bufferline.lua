return {
    {
        "akinsho/bufferline.nvim",
        dependencies =  { "kyazdani42/nvim-web-devicons", opt = true },
        init = function()
            require("bufferline").setup{}
        end
    }
}
