return {
	{
		"folke/snacks.nvim",
		enabled = true,
		priority = 1000,
		lazy = false,
		opts = {
			animate = { enabled = true },
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					keys = {
						{
							icon = "󱏒 ",
							desc = " File Explorer",
							key = "e",
							action = function()
								require("snacks").explorer()
							end,
						},
						{
							icon = "󰱼 ",
							desc = " Find file",
							key = "f",
							action = ":lua Snacks.picker.files()",
						},
						{
							icon = "󱋡 ",
							desc = " Find recent file",
							key = "r",
							action = ":lua Snacks.picker.recent()",
						},
						{
							icon = " ",
							desc = " Grep string on files",
							key = "g",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							desc = "Quit",
							key = "q",
							action = ":qa",
						},
					},
					header = [[]],
				},
				formats = {
					key = function(item)
						return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
					end,
				},
				sections = {
					{
						pane = 1,
						section = "terminal",
						cmd = "cat ~/.config/nvim/resources/images/linux.asc; sleep 0.1",
						height = 32,
						width = 64,
						padding = 5,
					},
					{
						pane = 2,
						section = "keys",
						gap = 6,
						indent = 5,
					},
					{
						section = "startup",
						indent = 60,
					},
				},
			},
			explorer = { enabled = true },
			image = {
				enabled = true,
				formats = {
					"png",
					"jpg",
					"jpeg",
					"gif",
					"bmp",
					"webp",
					"tiff",
					"heic",
					"avif",
					"mp4",
					"mov",
					"avi",
					"mkv",
					"webm",
				},
			},
			input = { enabled = false },
			notifier = { enabled = true },
			picker = { enabled = true },
			quickfile = { enabled = true },
			rename = { enabled = true },
			scroll = { enabled = true },
			zen = { enabled = true },
		},

		keys = {
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File explorer",
			},
			{
				"<leader>t",
				function()
					Snacks.terminal()
				end,
				desc = "Terminal",
			},
			{
				"<leader>o",
				function()
					Snacks.picker.spelling()
				end,
				desc = "Spelling",
			},
			{
				"<leader>i",
				function()
					Snacks.picker.treesitter()
				end,
				desc = "Code Outline",
			},
			{
				"<leader>r",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>u",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undo History",
			},
			{
				"<leader>q",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>>",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>,",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>?",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>;",
				function()
					Snacks.picker.jumps()
				end,
				desc = "Jumps",
			},
			{
				"<leader>.",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.search_history()
				end,
				desc = "Search History",
			},
			{
				"<leader>!",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<leader>§",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Clear Notifications",
			},
			-- Utils
			{
				"<leader>Ui",
				function()
					Snacks.picker.icons()
				end,
				desc = "Icons",
			},
			{
				"<leader>UT",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Colorschemes",
			},
			{
				"<leader>Uz",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>Un",
				desc = "Neovim News",
				function()
					Snacks.win({
						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
						width = 0.6,
						height = 0.6,
						wo = {
							spell = false,
							wrap = false,
							signcolumn = "yes",
							statuscolumn = " ",
							conceallevel = 3,
						},
					})
				end,
			},
			-- find
			{
				"<leader>Fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Config Files",
			},
			{
				"<leader>Ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Files",
			},
			{
				"<leader>Fg",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Git Files",
			},
			{
				"<leader>Fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<leader>Fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			{
				"<leader>FP",
				function()
					Snacks.picker.lazy()
				end,
				desc = "Plugin Files",
			},
			-- Grep
			{
				"<leader>Fl",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>Fb",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			-- Code
			-- {
			-- 	"<leader>Cd",
			-- 	function()
			-- 		Snacks.picker.diagnostics({
			-- 			layout = {
			-- 				preset = "bottom",
			-- 				preview = false,
			-- 			},
			-- 		})
			-- 	end,
			-- 	desc = "Diagnostics",
			-- },
			-- {
			-- 	"<leader>CD",
			-- 	function()
			-- 		Snacks.picker.diagnostics_buffer()
			-- 	end,
			-- 	desc = "Buffer Diagnostics",
			-- },
			-- git
			{
				"<leader>Gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<leader>Gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>GL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>Gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			{
				"<leader>GS",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "Git Stash",
			},
			{
				"<leader>Gu",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>Gf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log File",
			},
			{
				"<leader>GB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
			-- References
			{
				"<leader>Ha",
				function()
					Snacks.picker.autocmds()
				end,
				desc = "Autocmds",
			},
			{
				"<leader>Hc",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>Hh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>HH",
				function()
					Snacks.picker.highlights()
				end,
				desc = "Highlights",
			},
			{
				"<leader>Hk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>Hm",
				function()
					Snacks.picker.man()
				end,
				desc = "Man Pages",
			},
		},

		init = function()
			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = "OilActionsPost",
				callback = function(event)
					if event.data.actions.type == "move" then
						Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
					end
				end,
			})
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#0083ff" })
					vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#ff984a" })
					vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#ffffa0" })
					vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = "#0083ff" })
					vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#00ccff" })
				end,
			})
		end,
	},
}
