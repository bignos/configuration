return {
	{
		"NeogitOrg/neogit",
        enabled = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
            "folke/snacks.nvim",
		},
        keys = {
            -- Toggle the Neogit window
            {
                "<leader>Gg",
                vim.cmd.Neogit,
                desc = "Neogit",
            },
        },
	},
}
