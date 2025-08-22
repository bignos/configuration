local function get_poetry_python()
    local poetry_env_path = vim.fn.system("poetry env info -p"):gsub("%s+", "")
    if vim.v.shell_error ~= 0 or poetry_env_path == "" then
        vim.notify("Poetry environment not found", vim.log.levels.WARN)
        return nil
    end
    return poetry_env_path .. "/bin/python"
end


return {
	{
		"michaelb/sniprun",
		enabled = true,

		branch = "master",

		build = "sh install.sh",

		config = function()
			require("sniprun").setup({
				display = { "VirtualTextOk", "TerminalWithCode" },
                selected_interpreters = { "Python3_original" },
				interpreter_options = {
					Python3_original = {
						command = get_poetry_python(),
						args = { "-u" },
					},
				},
				display_options = {
					terminal_scrollback = vim.o.scrollback,
					terminal_line_number = false,
					terminal_signcolumn = false,
					terminal_position = "horizontal",
					terminal_height = 10,
				},
			})
		end,

        keys = {
            {
                "<leader>x",
                ":SnipRun<CR>",
                desc = "Run selection",
                mode = "v",
            }
        },
	},
}
