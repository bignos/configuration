return {
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        },
        init = function()
            require('refactoring').setup({
                -- prompt for return type
                prompt_func_return_type = {
                    go = true,
                    cpp = true,
                    c = true,
                    java = true,
                },
                -- prompt for function parameters
                prompt_func_param_type = {
                    go = true,
                    cpp = true,
                    c = true,
                    java = true,
                }
            })
            -- Remaps for the refactoring operations currently offered by the plugin
            vim.api.nvim_set_keymap("v", "<leader>re",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
                { noremap = true, silent = true, expr = false, desc = "Extract Function" })
            vim.api.nvim_set_keymap("v", "<leader>rf",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
                { noremap = true, silent = true, expr = false, desc = "Extract Function to file"  })
            vim.api.nvim_set_keymap("v", "<leader>rv",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
                { noremap = true, silent = true, expr = false, desc = "Extract Variable"  })
            vim.api.nvim_set_keymap("v", "<leader>ri",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                { noremap = true, silent = true, expr = false, desc = "Extract Inline variable"  })

            -- Extract block doesn't need visual mode
            vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
                { noremap = true, silent = true, expr = false, desc = "Extract Block"  })
            vim.api.nvim_set_keymap("n", "<leader>rbf",
                [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
                { noremap = true, silent = true, expr = false, desc = "Extract Block to file"  })

            -- Inline variable can also pick up the identifier currently under the cursor without visual mode
            vim.api.nvim_set_keymap("n", "<leader>ri",
                [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                { noremap = true, silent = true, expr = false, desc = "Extract Inline variable" })
        end
    }
}
