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
				-- { "<leader>a", group = ">Avante" },
				{ "<leader>U", group = ">Utils" },
				{ "<leader>D", group = ">Debug" },
				{ "<leader>F", group = ">Find" },
				{ "<leader>C", group = ">Code" },
				{ "<leader>G", group = ">Git" },
				{ "<leader>H", group = ">References" },
				{ "<leader>K", group = ">Kulala" },
				{ "<leader>M", group = ">BookMacro" },
                { "<leader>n", group = ">Neorg" },
				{ "<leader>R", group = ">Refactor" },
				{ "<leader>Y", group = ">Display" },
                { "g?", group = ">DebugPrint" },
			})
		end,
	},
}
