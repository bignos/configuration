return {
	{
		"nvim-neorg/neorg",
		enabled = true,
		lazy = false,
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.export"] = {},
					["core.export.markdown"] = {},
					["core.ui.calendar"] = {},
					["core.clipboard.code-blocks"] = {},
					["core.esupports.hop"] = {},
					["core.esupports.indent"] = {},
					["core.concealer"] = {},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.integrations.nvim-cmp"] = {},
				},
			})
		end,
	},
}
