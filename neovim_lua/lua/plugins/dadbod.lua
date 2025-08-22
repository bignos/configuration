return {
	{
		"kristijanhusak/vim-dadbod-completion",
		ft = { "sql" },
		dependencies = {
			"tpope/vim-dadbod",
		},
        keys = {
            { 
                "<leader>Ud",
                "<cmd>%DB<cr>",
                desc = "Execute SQL query",
            },
        },
	},
}
