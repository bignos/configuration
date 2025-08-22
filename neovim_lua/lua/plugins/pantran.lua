return {
    {
        "potamides/pantran.nvim",
        enabled = true,
        config = function()
            require("pantran").setup{
              default_engine = "google",
              engines = {
                google = {
                  default_source = "fr",
                  default_target = "en"
                },
              },
            }
        end,

        keys = {
            {
                "<leader>Ut",
                ":Pantran<CR>",
                desc = "Translate",
                mode = {"n", "v"},
            },
        },
    }
}
