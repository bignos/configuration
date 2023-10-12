return {
    {
        'sindrets/diffview.nvim',
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            -- Open diffview
            {
                "<leader>gd",
                vim.cmd.DiffviewOpen,
                desc = "Git Diff"
            },

            -- Close diffview
            {
                "<leader>gD",
                vim.cmd.DiffviewClose,
                desc = "Close Git Diff"
            },

            -- Git File History
            {
                "<leader>gh",
                vim.cmd.DiffviewFileHistory,
                desc = "Git File History"
            },

        },
    }
}
