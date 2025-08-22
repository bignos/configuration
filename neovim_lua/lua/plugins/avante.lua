return {
	{
		"yetone/avante.nvim",
        enabled = false,
		event = "VeryLazy",
		version = false,
        --@module 'avante'
        --@type avante.Config
		opts = {
			provider = "cerebras",
            providers = {
                openrouter = {
                    __inherited_from = "openai",
                    api_key_name = "OPENAI_API_KEY",
                    endpoint = "https://openrouter.ai/api/v1",
                    model = "deepseek/deepseek-chat-v3-0324:free",
                    disable_tools = true,
                },
                groq = {
                    __inherited_from = "openai",
                    api_key_name = "GROQ_API_KEY",
                    endpoint = "https://api.groq.com/openai/v1",
                    model = "deepseek-r1-distill-llama-70b",
                    disable_tools = true,
                },
                cerebras = {
                    __inherited_from = "openai",
                    api_key_name = "CEREBRAS_API_KEY",
                    endpoint = "https://api.cerebras.ai/v1",
                    model = "llama-4-scout-17b-16e-instruct",
                    disable_tools = true,
                },
                together = {
                    __inherited_from = "openai",
                    api_key_name = "TOGETHER_API_KEY",
                    endpoint = "https://api.together.xyz/v1",
                    model = "Qwen/Qwen2.5-Coder-32B-Instruct",
                    disable_tools = true,
                },
            },
		},
		build = "make",
		dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "hrsh7th/nvim-cmp",
            "steavearc/dressing.nvim",
            "nvim-tree/nvim-web-devicons",
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						use_absolute_path = true,
					},
				},
			},
			-- {
			-- 	"MeanderingProgrammer/render-markdown.nvim",
			-- 	opts = {
			-- 		file_types = { "markdown", "Avante" },
			-- 	},
			-- 	ft = { "markdown", "Avante" },
			-- },
		},
	},
}
