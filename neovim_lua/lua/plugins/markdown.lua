return {
    {
        'MeanderingProgrammer/markdown.nvim',
        name = 'render-markdown',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        keys = {
            {
                "<leader>V",
                vim.cmd.RenderMarkdownToggle,
                desc = "Markdown view toggle",
            }
        },
        config = function()
            require('render-markdown').setup({})
        end,
    }
}
