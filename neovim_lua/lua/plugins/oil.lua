return {
	{
		"stevearc/oil.nvim",
        enabled = true,
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		lazy = false,
        keys = {
            -- Toggle the Oil window
            {
                "<leader>E",
                function()
                    -- If there is an Oil window, close it
                   -- for _, win in ipairs(vim.api.nvim_list_wins()) do
                   --     local buf = vim.api.nvim_win_get_buf(win)
                   --     local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
                   --     if filetype == "oil" then
                   --         vim.api.nvim_win_close(win, true)
                   --         return
                   --     end
                   -- end
                    -- Else
                   -- vim.cmd.vsplit()
                   -- vim.cmd("vertical resize 40")
                    vim.cmd.Oil()
                end,
                desc = "Oil",
            },
        },
	},
}
