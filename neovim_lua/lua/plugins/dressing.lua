return {
	{
		"stevearc/dressing.nvim",
		enabled = true,
		event = "VeryLazy",
		init = function()
			require("dressing").setup({
				input = {
					relative = "editor",
				},
			})
		end,
		opts = {
			input = {
				enabled = true,
			},
			select = {
				enabled = true,
			},
		},
	},
}
