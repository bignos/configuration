return {
    {
        "ms-jpq/chadtree",
        branch = "chad",
        keys = {
            {
                "<leader>e",
                vim.cmd.CHADopen,
                desc = "Chadtree",
            }
        },
        init = function()
            io.popen("python3 -m chadtree deps")
        end
    }
}
