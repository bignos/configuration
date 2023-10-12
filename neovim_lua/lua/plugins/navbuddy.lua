return {
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			"numToStr/Comment.nvim",
			"nvim-telescope/telescope.nvim",
		},
        keys = {
            {
                "<leader>n",
                vim.cmd.Navbuddy,
                desc = "code Navigator Navbuddy"
            }
        },
        init = function()
            require("nvim-navbuddy").setup({
                lsp = {
                    auto_attach = true,
                }
            })
        end
	},
}
