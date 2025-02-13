return {
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "mason.nvim" },
        opts = function()
            local nls = require("null-ls")
            return {
                sources = {
                    -- nls.builtins.formatting.prettierd,
                    nls.builtins.formatting.prettier.with({
                        filetypes = { "html", "json", "yaml", "markdown" },
                    }),
                    nls.builtins.formatting.erb_format.with({
                        filetypes = { "eruby" },                        
                    }),
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.rufo,
                    --nls.builtins.diagnostics.flake8,
                },
            }
        end,
    }
}
