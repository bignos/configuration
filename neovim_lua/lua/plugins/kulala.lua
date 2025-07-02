vim.filetype.add({
    extension = {
        ['http'] = 'http',
    },
})
return {
	{
		"mistweaverco/kulala.nvim",
		enabled = true,
        dependencies = {
            { "ellisonleao/dotenv.nvim" }
        },
		keys = {
			{ "<leader>Rs", desc = "Send request" },
			{ "<leader>Ra", desc = "Send all requests" },
			{ "<leader>Rb", desc = "Open scratchpad" },
		},
		ft = { "http", "rest" },
		opts = function()
            local dotenv = require("dotenv").values
            return {
                env = dotenv,
			    global_keymaps = true,
            }
        end,
	},
}
