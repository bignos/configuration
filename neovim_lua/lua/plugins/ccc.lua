return {
	{
		"uga-rosa/ccc.nvim",
		enabled = true,
		config = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
		keys = {
			{
				"<leader>Uc",
				":CccPick<CR>",
				desc = "Color Picker",
			},
		},
	},
}
