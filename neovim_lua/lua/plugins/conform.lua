return {
	{
		"stevearc/conform.nvim",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				format_on_save = false,
				formatters_by_ft = {
					html     = { "prettier" },
					json     = { "prettier" },
					yaml     = { "prettier" },
					markdown = { "prettier" },
					eruby    = { "erb_format" },
					lua      = { "stylua" },
					ruby     = { "rufo" },
                    python   = { "black" },
				},
			})
		end,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({
					    async        = true,
					    lsp_fallback = true
					})
				end,
				desc = "Format buffer",
			},
		},
	},
}
