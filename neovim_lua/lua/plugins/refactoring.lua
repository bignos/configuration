return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		lazy = false,
		init = function()
			require("refactoring").setup({
				-- prompt for return type
				prompt_func_return_type = {
					go = true,
					cpp = true,
					c = true,
					java = true,
					python = true,
					javascript = true,
					ruby = true,
				},
				-- prompt for function parameters
				prompt_func_param_type = {
					go = true,
					cpp = true,
					c = true,
					java = true,
					python = true,
					javascript = true,
					ruby = true,
				},
			})

			-- Remaps for the refactoring operations currently offered by the plugin
			vim.keymap.set({ "n", "x" }, "<leader>Rf", function()
				return require("refactoring").refactor("Extract Function")
			end, { expr = true, desc = "Extract Function" })
			vim.keymap.set({ "n", "x" }, "<leader>RF", function()
				return require("refactoring").refactor("Extract Function To File")
			end, { expr = true, desc = "Extract Function To File" })
			vim.keymap.set({ "n", "x" }, "<leader>Rv", function()
				return require("refactoring").refactor("Extract Variable")
			end, { expr = true, desc = "Extract Variable" })
			vim.keymap.set({ "n", "x" }, "<leader>Ri", function()
				return require("refactoring").refactor("Inline Function")
			end, { expr = true, desc = "Inline Function" })
			vim.keymap.set({ "n", "x" }, "<leader>RI", function()
				return require("refactoring").refactor("Inline Variable")
			end, { expr = true, desc = "Inline Variable" })

			vim.keymap.set({ "n", "x" }, "<leader>Rb", function()
				return require("refactoring").refactor("Extract Block")
			end, { expr = true, desc = "Extract Block" })
			vim.keymap.set({ "n", "x" }, "<leader>RB", function()
				return require("refactoring").refactor("Extract Block To File")
			end, { expr = true, desc = "Extract Block To File" })
		end,
	},
}
