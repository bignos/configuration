return {
	{
		"Wansmer/treesj",
        enabled = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({--[[ your config ]]
			})
		end,
        keys = {
            -- Toggle the tressj
            {
                "<leader>m",
                function()
                    require("treesj").toggle()
                end,
                desc = "TreeSJ",
            },
        },
	},
}
