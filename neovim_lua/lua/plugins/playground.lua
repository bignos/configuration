return {
    {
        "nvim-treesitter/playground",
        keys = {
            -- Toggle Playground
            {
                "<leader>S",
                vim.cmd.TSPlaygroundToggle,
                desc = "Playground",
            },
        }
    }
}
