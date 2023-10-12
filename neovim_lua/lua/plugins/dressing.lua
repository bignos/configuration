return {
    {
        "stevearc/dressing.nvim",
        init = function()
            require('dressing').setup({
                input = {
                    relative = 'editor',
                },
            })
        end
    },
}
