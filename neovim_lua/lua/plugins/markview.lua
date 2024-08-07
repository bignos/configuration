return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
        keys = {
            {
                "<leader>V",
                vim.cmd.Markview,
                desc = "Markdown view toggle",
            }
        },
	},
}
