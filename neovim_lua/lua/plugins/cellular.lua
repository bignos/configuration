return {
	{
		"eandrju/cellular-automaton.nvim",
		enabled = true,
		keys = {
			{
				"<leader>*",
				"<cmd>CellularAutomaton make_it_rain<cr>",
				desc = "Make it rain",
			},
			{
				"<leader>µ",
				"<cmd>CellularAutomaton game_of_life<cr>",
				desc = "Game of life",
			},
		},
	},
}
