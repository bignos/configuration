local function chadopen()
    require('chadtree')
    vim.cmd.CHADopen()
    return 'CHADopen'
end

local function grep_string()
    require('telescope.builtin').grep_string({search = vim.fn.input("Grep > ") })
    return 'Telescope grep_files'
end

return {
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'kyazdani42/nvim-web-devicons' } },
        config = function()
            require('dashboard').setup {
                theme = 'doom',
                config = {
                    header = {
                        [[                                                                                                                              ]],
                        [[                                                                                                                              ]],
                        [[NNNNNNNN        NNNNNNNN                                  VVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM]],
                        [[N:::::::N       N::::::N                                  V::::::V           V::::::VI::::::::IM:::::::M             M:::::::M]],
                        [[N::::::::N      N::::::N                                  V::::::V           V::::::VI::::::::IM::::::::M           M::::::::M]],
                        [[N:::::::::N     N::::::N                                  V::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::M]],
                        [[N::::::::::N    N::::::N    eeeeeeeeeeee       ooooooooooo V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M]],
                        [[N:::::::::::N   N::::::N  ee::::::::::::ee   oo:::::::::::ooV:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M]],
                        [[N:::::::N::::N  N::::::N e::::::eeeee:::::eeo:::::::::::::::oV:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M]],
                        [[N::::::N N::::N N::::::Ne::::::e     e:::::eo:::::ooooo:::::o V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M]],
                        [[N::::::N  N::::N:::::::Ne:::::::eeeee::::::eo::::o     o::::o  V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M]],
                        [[N::::::N   N:::::::::::Ne:::::::::::::::::e o::::o     o::::o   V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M]],
                        [[N::::::N    N::::::::::Ne::::::eeeeeeeeeee  o::::o     o::::o    V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M]],
                        [[N::::::N     N:::::::::Ne:::::::e           o::::o     o::::o     V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M]],
                        [[N::::::N      N::::::::Ne::::::::e          o:::::ooooo:::::o      V:::::::V         II::::::IIM::::::M               M::::::M]],
                        [[N::::::N       N:::::::N e::::::::eeeeeeee  o:::::::::::::::o       V:::::V          I::::::::IM::::::M               M::::::M]],
                        [[N::::::N        N::::::N  ee:::::::::::::e   oo:::::::::::oo         V:::V           I::::::::IM::::::M               M::::::M]],
                        [[NNNNNNNN         NNNNNNN    eeeeeeeeeeeeee     ooooooooooo            VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM]],
                        [[                                                                                                                              ]],
                        [[                                                                                                                              ]],
                        [[                                                                                                                              ]],
                        [[                                                                                                                              ]],
                        [[                                                                                                                              ]],
                        [[                                                                                                                              ]],
                        [[                                                                                                                              ]],
                    }, --your header
                    center = {
                        {
                            icon = '󱏒 ',
                            icon_hl = 'Title',
                            desc = ' File Explorer',
                            desc_hl = 'String',
                            key = 'e',
                            keymap = 'SPC e',
                            key_hl = 'Number',
                            action = chadopen,
                        },
                        {
                            icon = '󰱼 ',
                            icon_hl = 'Title',
                            desc = ' Find file',
                            desc_hl = 'String',
                            key = 'f',
                            keymap = 'SPC f f',
                            key_hl = 'Number',
                            action = 'Telescope find_files'
                        },
                        {
                            icon = '󱋡 ',
                            icon_hl = 'Title',
                            desc = ' Find recent file',
                            desc_hl = 'String',
                            key = 'r',
                            keymap = 'SPC f r',
                            key_hl = 'Number',
                            action = 'Telescope oldfiles'
                        },
                        {
                            icon = ' ',
                            icon_hl = 'Title',
                            desc = ' Grep string on files',
                            desc_hl = 'String',
                            key = 'g',
                            keymap = 'SPC f s',
                            key_hl = 'Number',
                            action = grep_string
                        },
                    },
                    footer = {} --your footer
                } -- config
            }
        end,
    }
}
