return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'mfussenegger/nvim-dap' }, -- Optional
            { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
            { 'jay-babu/mason-nvim-dap.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        },
        init = function()
            local lsp = require('lsp-zero').preset({
                name = 'minimal',
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = false,
            })

            require('mason').setup()
            require('mason-nvim-dap').setup({
                ensure_installed = { 'python', 'stylua' },
                handlers = {},
            })
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
            require('dapui').setup()

            lsp.set_sign_icons({
              error = '✘',
              warn = '▲',
              hint = '⚑',
              info = ''
            })

            vim.diagnostic.config({
              virtual_text = false,
              severity_sort = true,
              float = {
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
              },
            })

            local cmp = require('cmp')
            local cmp_action = lsp.cmp_action()
            local cmp_format = lsp.cmp_format()

            cmp.setup({
                formatting = cmp_format,
                preselect = 'item',
                completion = {
                    autocomplete = false,  -- No toggle auto the completion menu
                },
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp'},
                    {name = 'nvim_lua'},
                    {name = 'buffer', keyword_length = 3},
                    {name = 'luasnip', keyword_length = 2},
                },
                window = {
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<cr>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                })
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            lsp.on_attach(function(_, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format() end, { desc = "Format buffer" })

                vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, {desc = "Goto definition"})
                vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, {desc = "Goto declaration"})
                vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, {desc = "Hover"})
                vim.keymap.set('n', '<leader>vs', function() vim.lsp.buf.workspace_symbol() end, {desc = "Workspace symbol"})
                vim.keymap.set('n', '<leader>vd', function() vim.lsp.buf.diagnostic.open_float() end, {desc = "Show diagnostic"})
                vim.keymap.set('n', '[d', function() vim.lsp.buf.diagnostic.goto_next() end, {desc = "Next diagnostic"})
                vim.keymap.set('n', ']d', function() vim.lsp.buf.diagnostic.goto_prev() end, {desc = "Prev diagnostic"})
                vim.keymap.set('n', '<leader>vc', function() vim.lsp.buf.code_action() end, {desc = "Code Action"})
                vim.keymap.set('n', '<leader>vr', function() vim.lsp.buf.references() end, {desc = "References"})
                vim.keymap.set('n', '<leader>vS', function() vim.lsp.buf.rename() end, {desc = "Rename"})
                vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, {desc = "Signature help"})

                -- DAP
                vim.keymap.set('n', '<leader>Db', function() require('dap').toggle_breakpoint() end, {desc = "Toggle Breakpoint"})
                vim.keymap.set('n', '<leader>DB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, {desc = "Set Conditional Breakpoint"})
                vim.keymap.set('n', '<leader>Dc', function() require('dap').continue() end, {desc = "Continue"})
                vim.keymap.set('n', '<leader>DC', function() require('dap').close() end, {desc = "Close"})
                vim.keymap.set('n', '<leader>Di', function() require('dap').step_into() end, {desc = "Step Into"})
                vim.keymap.set('n', '<leader>Do', function() require('dap').step_over() end, {desc = "Step Over"})
                vim.keymap.set('n', '<leader>DO', function() require('dap').step_out() end, {desc = "Step Out"})
                vim.keymap.set('n', '<leader>Dr', function() require('dap').repl.open() end, {desc = "Repl"})
                vim.keymap.set('n', '<leader>Dl', function() require('dap').run_last() end, {desc = "Run Last"})
                vim.keymap.set('n', '<leader>Dt', function() require('dapui').toggle() end, {desc = "Toggle UI"})
            end)

            lsp.setup()
        end
    }
}
