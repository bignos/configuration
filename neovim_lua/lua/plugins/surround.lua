return {
    {
        "kylechui/nvim-surround",
        init = function()
            require("nvim-surround").setup({
                -- Change mapping to avoid conflict with Leap
                keymaps = {
                    visual = "<leader>s",
                    visual_line = "<leader>S"
                }
            })
        end
    }
}
