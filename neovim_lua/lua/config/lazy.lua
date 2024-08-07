local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        version = false, -- always use the latest git commit
    },
    install = { colorscheme = { "flow" } },
    checker = { enabled = true, notify = false }, -- automatically check for plugin updates
})
require("config.keymaps")
require("config.autocmds")
