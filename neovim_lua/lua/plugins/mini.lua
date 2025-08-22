return {
	{
		"echasnovski/mini.nvim",
		enabled = true,
		version = false,
        event = { "BufReadPre", "BufNewFile" },
		config = function()
            -- [ Indent Scope ]
			require("mini.indentscope").setup({
                symbol = "│",
                options = { try_as_border = true },
            })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "help", "lazy", "mason" },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })

            -- [ SplitJoin ]
            require("mini.splitjoin").setup()

            -- [ Comment ]
            require("mini.comment").setup({
                mappings = {
                    comment_visual = "<leader>c",
                    comment = "",
                    comment_line = "gcc",
                    textobject = "",
                }
            })

            -- [ Surround ]
            require("mini.surround").setup()

            -- [ Basics ]
            require("mini.basics").setup()

            -- [ Git ]
            require('mini.git').setup()

		end,

        keys = {
            {
                "<leader>j",
                mode = { "n", "v" },
                function()
                    require("mini.splitjoin").toggle()
                end,
                desc = "Split | Join",
            },
        },
	},
}
