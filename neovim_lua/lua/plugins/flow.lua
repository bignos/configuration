return {
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("flow").setup({
				transparent = false,     -- Set transparent background.
				fluo_color = "yellow",   -- Fluo color: pink, yellow, orange, or green.
				mode = "normal",         -- Intensity of the palette: normal, bright, desaturate, or dark. Notice that dark is ugly!
				aggressive_spell = true, -- Display colors for spell check.
			})

			vim.cmd("colorscheme flow")
		end,
	},
}
