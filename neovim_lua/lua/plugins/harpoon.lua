return {
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            local term = require("harpoon.term")
            vim.keymap.set("n", "<leader>m", mark.toggle_file, { desc = "Mark/Unmark the current file" })
            vim.keymap.set("n", "<leader>C", mark.clear_all, { desc = "Clear all Marks" })
            vim.keymap.set("n", "<leader>h", ui.nav_prev, { desc = "Goto previous Mark" })
            vim.keymap.set("n", "<leader>l", ui.nav_next, { desc = "Goto next Mark" })
            vim.keymap.set("n", "<leader>t", function() term.gotoTerminal(1) end, { desc = "Goto terminal 1" })
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Open Harpoon" })
        end
    }
}
