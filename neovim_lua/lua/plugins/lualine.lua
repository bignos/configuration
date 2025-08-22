return {
    {
        "nvim-lualine/lualine.nvim",
        enabled = true,
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        init = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress', function() return "󰋇 " .. vim.api.nvim_win_get_cursor(0)[1] end },
                    lualine_z = { function() return " " .. os.date("%R") end }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {
                    lualine_a = {},
                    lualine_b = { 
                        function()
                            if require("nvim-navic").is_available() then
                                return ""
                            end
                            return ""
                        end 
                    },
                    lualine_c = { {
                        -- stylua: ignore
                        function()
                            -- Specific settings for markdown files
                            if vim.bo.filetype == "markdown" then
                                require("nvim-navic").setup({
                                    icons = {
                                        String = "",
                                    },
                                })
                            end
                            return require("nvim-navic").get_location()
                        end,
                        cond = function()
                            return package.loaded["nvim-navic"] and
                                require("nvim-navic").is_available()
                        end,
                    } },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
                inactive_winbar = {},
                extensions = {}
            }
        end
    }
}
