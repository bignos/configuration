-- lazy
vim.keymap.set("n", "<leader>L", vim.cmd.Lazy, { desc = "Lazy" })

-- Buffers
vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Netrw
vim.keymap.set("n", "<leader>E", vim.cmd.Lexplore, { desc = "File Explorer" })

-- Terminal
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Normal mode for Terminal" })

-- Move line in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

-- The missing yank
vim.keymap.set("n", "Y", "yg$", { desc = "The missing yank" })

-- Join without the cursor motion
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Centered Page-down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page-down" })

-- Centered Page-up
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page-up" })

-- Centered Next search
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search" })

-- Centered Previous search
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search" })

-- No Q hole
vim.keymap.set("n", "Q", "<nop>")

-- Better system integration with system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank to clipboard" })

vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete to the blackhole" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete to the blackhole" })

-- Quick and location list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quick list" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quick list" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list" })

-- Live replace
vim.keymap.set(
    "n", "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Rename all occurrence of the word under the cursor" }
)

-- Reload a config file
vim.keymap.set(
    "n", "<leader><leader>",
    function()
        vim.cmd("so")
    end,
    { desc = "Source the current file" }
)
