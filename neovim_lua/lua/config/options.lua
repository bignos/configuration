vim.g.mapleader          = " "
vim.g.maplocalleader     = " "

-- netrw
vim.g.netrw_winsize      = 16
vim.g.netrw_liststyle    = 3
vim.g.netrw_banner       = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_altv         = 1


local opt          = vim.opt

-- Folding linked with treesitter
opt.foldlevel      = 20
opt.foldmethod     = "expr"
opt.foldexpr       = "nvim_treesitter#foldexpr()"

-- Conceal
opt.conceallevel   = 3

-- Neovim
opt.nu             = true
opt.relativenumber = true

opt.tabstop        = 4
opt.softtabstop    = 4
opt.shiftwidth     = 4
opt.expandtab      = true

opt.smartindent    = true
opt.wrap           = false

opt.swapfile       = false
opt.backup         = false
opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile       = true

opt.hlsearch       = false
opt.incsearch      = true

opt.termguicolors  = true
