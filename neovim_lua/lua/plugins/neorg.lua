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
                    ["core.keybinds"] = {
                        config = {
                            default_keybinds = true,
                        }
                    },
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
            -- vim.keymap.set("n", "<leader>N", "<Plug>(neorg.dirman.new-note)", { desc = "New Neorg Note" })
		end,
	},
}
