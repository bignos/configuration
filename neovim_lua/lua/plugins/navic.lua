return {
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" },
        lazy = true,
        init = function()
            vim.g.navic_silence = true
            require("helpers.utils").on_attach(function(client, buffer)
                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, buffer)
                end
            end)
        end,
        opts = function()
            return {
                separator = "  ",
                highlight = true,
                depth_limit = 5,
                icons = {
                    File          = " ",
                    Module        = " ",
                    Namespace     = " ",
                    Package       = " ",
                    Class         = " ",
                    Method        = " ",
                    Property      = " ",
                    Field         = " ",
                    Constructor   = " ",
                    Enum          = "練",
                    Interface     = "練",
                    Function      = " ",
                    Variable      = " ",
                    Constant      = " ",
                    String        = " ",
                    Number        = " ",
                    Boolean       = "◩ ",
                    Array         = " ",
                    Object        = " ",
                    Key           = " ",
                    Null          = "ﳠ ",
                    EnumMember    = " ",
                    Struct        = " ",
                    Event         = " ",
                    Operator      = " ",
                    TypeParameter = " ",
                },
            }
        end,
    }
}
