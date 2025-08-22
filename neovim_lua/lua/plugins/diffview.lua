return {
    {
        'sindrets/diffview.nvim',
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            -- Open diffview
            {
                "<leader>Gd",
                vim.cmd.DiffviewOpen,
                desc = "Git Diff"
            },

            -- Close diffview
            {
                "<leader>GD",
                vim.cmd.DiffviewClose,
                desc = "Close Git Diff"
            },

            -- Git File History
            {
                "<leader>Gh",
                vim.cmd.DiffviewFileHistory,
                desc = "Git File History"
            },

        },
    }
}
