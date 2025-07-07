return {
    {
        'neovim/nvim-lspconfig',
        enabled = true,
        
        dependencies = {
            -- LSP Support
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'mfussenegger/nvim-dap' },
            { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
            { 'jay-babu/mason-nvim-dap.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
        },

        config = function()
            local cmp = require('cmp')
            local cmp_lsp = require('cmp_nvim_lsp')

            local capabilities = vim.tbl_deep_extend(
                'force',
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())
            require("fidget").setup({})
            require('mason').setup()
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                },
            })
            require('dapui').setup()

            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                -- formatting = cmp_format,
                preselect = 'item',
                completion = {
                    autocomplete = false,  -- No toggle auto the completion menu
                },
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp'},
                    {name = 'nvim_lua'},
                    {name = 'buffer', keyword_length = 3},
                    {name = 'neorg'},
                    
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
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                }, { 
                    { name = 'buffer' },
                })
            })

            vim.diagnostic.config({
                signs = {
                    active = true,
                    text = {
                      [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.HINT] = "",
                        [vim.diagnostic.severity.INFO] = "",
                    },
                },
                virtual_text = false,
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
        end,
    }
}
