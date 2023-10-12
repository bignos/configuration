return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            -- Find Files
            {
                "<leader>ff",
                function() require("telescope.builtin").find_files() end,
                desc = "Find Files",
            },

            -- Find Recent files
            {
                "<leader>fr",
                function() require("telescope.builtin").oldfiles() end,
                desc = "Find Recent files",
            },


            -- Find Buffers
            {
                "<leader>fb",
                function() require("telescope.builtin").buffers() end,
                desc = "Find Buffers",
            },

            -- Find Git files
            {
                "<leader>fg",
                function() require("telescope.builtin").git_files() end,
                desc = "Find Git File",
            },

            -- Find Strings on files
            {
                "<leader>fs",
                function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end,
                desc = "Find Strings on files",
            },

            -- Find Symbols from Treesiter
            {
                "<leader>fS",
                function() require("telescope.builtin").treesitter() end,
                desc = "Find Symbols",
            },

            -- Find Diagnostics lsp
            {
                "<leader>fd",
                function() require("telescope.builtin").diagnostics() end,
                desc = "Find Diagnostics lsp",
            },

            -- Find Plugin files (Lazy specific)
            {
                "<leader>fp",
                function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
                desc = "Find Plugin File",
            },

        },
        init = function()
            local trouble = require("trouble.providers.telescope")
            local telescope = require("telescope")
            telescope.setup {
                defaults = {
                    mappings = {
                        i = { ["<c-t>"] = trouble.open_with_trouble },
                        n = { ["<c-t>"] = trouble.open_with_trouble },
                    },
                },
            }
        end
    },
}
