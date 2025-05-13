return {
	{
		"nvim-tree/nvim-tree.lua",
        enabled = true,
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
        keys = {
            {
                "<leader>e",
                vim.cmd.NvimTreeToggle,
                desc = "Toggle NvimTree",
            }
        },
		config = function()
			require("nvim-tree").setup({})
		end,
	},
}
