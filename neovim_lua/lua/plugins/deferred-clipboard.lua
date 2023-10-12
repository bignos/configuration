return {
    {
        "EtiamNullam/deferred-clipboard.nvim",
        init = function()
            require('deferred-clipboard').setup({
                fallback = 'unnamedplus',
                lazy = true,
                force_init_unnamed = true,
            })
        end
    }
}
