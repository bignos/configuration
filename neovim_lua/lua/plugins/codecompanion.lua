return {
	{
		"olimorris/codecompanion.nvim",
		enabled = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
            display = {
                action_palette = {
                    provider = "snacks",
                }
            },
			strategies = {
				chat = {
					adapter = "openrouter",
				},
				inline = {
					adapter = "openrouter",
				},
			},
			adapters = {
				openrouter = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://openrouter.ai/api",
							api_key = os.getenv("OPENAI_API_KEY"),
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = "deepseek/deepseek-chat-v3-0324:free",
							},
						},
					})
				end,
				groq = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://api.groq.com/openai",
							api_key = os.getenv("GROQ_API_KEY"),
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = "deepseek-r1-distill-llama-70b",
							},
						},
					})
				end,
				cerebras = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://api.cerebras.ai",
							api_key = os.getenv("CEREBRAS_API_KEY"),
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = "llama-4-scout-17b-16e-instruct",
							},
						},
					})
				end,
				together = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://api.together.xyz",
							api_key = os.getenv("TOGETHER_API_KEY"),
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = "Qwen/Qwen2.5-Coder-32B-Instruct",
							},
						},
					})
				end,
			},
		},
		keys = {
			{
				"<leader>c",
				"<cmd>CodeCompanionChat Toggle<cr>",
				desc = "Code Companion",
				mode = "n",
			},
			{
				"<leader>q",
                ":CodeCompanion<cr>",
				desc = "Question Code Companion",
				mode = "x",
			},
			{
				"<leader>Cq",
                ":CodeCompanionAction<cr>",
				desc = "Code Companion Action",
				mode = "n",
			},
		},
	},
}
