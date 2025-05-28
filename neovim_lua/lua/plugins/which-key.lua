return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function(_, _)
			vim.o.timeout = true
			vim.o.timeoutlen = 500

			local wk = require("which-key")
			wk.setup({
				plugins = {
					spelling = {
						enabled = true,
					},
				},
				win = {
					border = "single",
				},
			})
			wk.add({
				mode = { "n", "v" },
				{ "<leader>a", group = ">Avante" },
				{ "<leader>D", group = ">Debug" },
				{ "<leader>M", group = ">BookMacro" },
				{ "<leader>f", group = ">Find" },
				{ "<leader>g", group = ">Git" },
				{ "<leader>r", group = ">Refactor" },
				{ "<leader>R", group = ">Rest" },
				{ "<leader>v", group = ">Code" },
				{ "<leader>x", group = ">Trouble" },
			})
		end,
	},
}
