return {
	{
		"catgoose/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = {
			lazy_load = true,
		},
		init = function()
			require("colorizer").setup({
				filetypes = {
					"*",
					cmp_docs = { always_update = true },
				},
				user_default_options = {
					tailwind = "both",
					tailwind_opts = {
						update_names = true,
					},
					css = true,
				},
			})
		end,
	},
}
