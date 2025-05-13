return {
	{
		"NeogitOrg/neogit",
        enabled = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			"nvim-telescope/telescope.nvim",
		},
        keys = {
            -- Toggle the Neogit window
            {
                "<leader>gg",
                vim.cmd.Neogit,
                desc = "Neogit",
            },
        },
	},
}
