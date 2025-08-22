return {
	{
		"neovim/nvim-lspconfig",
		enabled = true,

		dependencies = {
			-- LSP Support
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "mfussenegger/nvim-dap" },
			{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
			{ "jay-babu/mason-nvim-dap.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
		},

		config = function()
            -- Completion
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")

			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)
			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,
				},
			})
			require("dapui").setup()

			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			cmp.setup({
				-- formatting = cmp_format,
				preselect = "item",
				completion = {
					autocomplete = false, -- No toggle auto the completion menu
				},
				window = {
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<cr>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
				}, {
					{ name = "buffer", keyword_length = 3 },
				}),

				cmp.setup.filetype("lua", {
					sources = cmp.config.sources({
						{ name = "nvim_lua" },
					}, {
						{ name = "buffer", keyword_length = 3 },
					}),
				}),

				cmp.setup.filetype("norg", {
					sources = cmp.config.sources({
						{ name = "neorg" },
					}, {
						{ name = "buffer", keyword_length = 3 },
					}),
				}),

				cmp.setup.filetype("sql", {
					sources = cmp.config.sources({
						{ name = "vim-dadbod-completion" },
					}, {
						{ name = "buffer", keyword_length = 3 },
					}),
				}),
			})

			local icons = require("nvim-web-devicons")

			local severity_icons = {
				[vim.diagnostic.severity.ERROR] = icons.get_icon_by_filetype("log", { default = true }),
				[vim.diagnostic.severity.WARN] = icons.get_icon_by_filetype("conf", { default = true }),
				[vim.diagnostic.severity.HINT] = icons.get_icon_by_filetype("md", { default = true }),
				[vim.diagnostic.severity.INFO] = icons.get_icon_by_filetype("json", { default = true }),
			}

			vim.diagnostic.config({
				signs = {
					active = true,
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			vim.keymap.set("n", "<leader>Um", function()
				vim.cmd("Mason")
			end, { desc = "Mason" })

			vim.keymap.set("n", "gd", function()
				Snacks.picker.lsp_definitions()
			end, { desc = "Goto definition LSP" })
			vim.keymap.set("n", "gD", function()
				Snacks.picker.lsp_declarations()
			end, { desc = "Goto declaration" })
			vim.keymap.set("n", "gh", function()
				vim.lsp.buf.hover()
			end, { desc = "Hover" })
			vim.keymap.set("n", "gr", function()
				Snacks.picker.lsp_references()
			end, { desc = "References" })
			vim.keymap.set("n", "gI", function()
				Snacks.picker.lsp_implementations()
			end, { desc = "Goto implementation" })
			vim.keymap.set("n", "gj", function()
				Snacks.picker.lsp_type_definitions()
			end, { desc = "Goto type definition" })
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, { desc = "Next diagnostic" })
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, { desc = "Prev diagnostic" })
			vim.keymap.set("n", "<leader>CA", function()
				vim.lsp.buf.code_action()
			end, { desc = "Code Action" })
			vim.keymap.set("n", "<leader>Cr", function()
				vim.lsp.buf.references()
			end, { desc = "References" })
			vim.keymap.set("n", "<leader>CR", function()
				vim.lsp.buf.rename()
			end, { desc = "Rename" })
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, { desc = "Signature help" })

			-- DAP
			vim.keymap.set("n", "<leader>Db", function()
				require("dap").toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>DB", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Set Conditional Breakpoint" })
			vim.keymap.set("n", "<leader>Dc", function()
				require("dap").continue()
			end, { desc = "Continue" })
			vim.keymap.set("n", "<leader>Dq", function()
				require("dap").close()
			end, { desc = "Close" })
			vim.keymap.set("n", "<leader>Di", function()
				require("dap").step_into()
			end, { desc = "Step Into" })
			vim.keymap.set("n", "<leader>DO", function()
				require("dap").step_over()
			end, { desc = "Step Over" })
			vim.keymap.set("n", "<leader>Do", function()
				require("dap").step_out()
			end, { desc = "Step Out" })
			vim.keymap.set("n", "<leader>Dr", function()
				require("dap").repl.open()
			end, { desc = "Repl" })
			vim.keymap.set("n", "<leader>Dl", function()
				require("dap").run_last()
			end, { desc = "Run Last" })
			vim.keymap.set("n", "<leader>Dt", function()
				require("dapui").toggle()
			end, { desc = "Toggle UI" })
		end,
	},
}
