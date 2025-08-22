return {
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		dependencies = {
			-- include a picker of your choice, see picker section for more details
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"folke/snacks.nvim",
		},
		opts = {
			---@type lc.lang
			lang = "python3",
			---@type lc.picker
			picker = { provider = 'snacks-picker' },
		},
	},
}
