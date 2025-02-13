return {
    {
        "cenk1cenk2/scratch.nvim",
        keys = {
            {
                "<leader>a",
                function()
                    vim.cmd.vsplit()
                    vim.cmd.wincmd('l')
                    require("scratch").create()
                end
                ,
                desc = "Create Scratch Buffer",
            }
        },
    }
}
