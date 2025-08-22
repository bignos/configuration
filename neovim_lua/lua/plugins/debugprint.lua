return {
	{
		"andrewferrier/debugprint.nvim",
        enabled = true,

		lazy = false,
		version = "*",

        config = function()
            require("debugprint").setup()
        end,
	},
}
