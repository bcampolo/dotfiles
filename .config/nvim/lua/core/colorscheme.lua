-- vim.cmd.colorscheme "monokai"
-- vim.cmd.colorscheme "moonfly"
-- vim.cmd.colorscheme "sonokai"
-- vim.cmd.colorscheme "monokai_pro"
-- vim.cmd.colorscheme "srcery"
-- vim.cmd.colorscheme "PaperColor"
-- vim.cmd.colorscheme "jellybeans"
-- vim.cmd([[
--   let g:gruvbox_italic=1
--   let g:gruvbox_contrast_dark='hard'
-- ]])
-- vim.cmd.colorscheme "gruvbox"
-- vim.cmd.colorscheme "badwolf"
-- vim.cmd.colorscheme "hybrid"
-- vim.cmd.colorscheme "tokyonight-night"
-- vim.cmd.colorscheme "gruvbox-material"
-- vim.cmd.colorscheme "codedark"
-- vim.cmd.colorscheme "catppuccin-mocha"
-- vim.cmd.colorscheme "neon"
-- vim.cmd.colorscheme "ayu"

-- require('kanagawa').setup({
--   colors = {
--     palette = {
--       -- change all usages of these colors
--       sumiInk0 = "#000000",
--       fujiWhite = "#FFFFFF",
--     },
--     theme = {
--       -- change specific usages for a certain theme, or for all of them
--       wave = {
--         ui = {
--           diff = {
--             delete = "#00FF00",
--           },
--         },
--       },
--     }
--   },
-- })

-- diff
-- if vim.fn.diff_get('&diff') == 1 then                                                                                                                                 │
-- vim.cmd.colorscheme "github_dark"
-- else
vim.cmd.colorscheme "kanagawa"
-- end
-- vim.cmd('hi diffAdded      gui=none    guifg=NONE          guibg=#bada9f')
-- vim.cmd('hi diffChanged   gui=none    guifg=NONE          guibg=#e5d5ac')
-- vim.cmd('hi diffDeleted   gui=bold    guifg=#ff8080       guibg=#ffb0b0')
-- vim.cmd('highlight DiffAdd guifg=#ffffff guibg=00ff00')
-- vim.cmd('highlight diffAdded guifg=#ffffff guibg=00ff00')
-- vim.cmd('hi diffText     gui=none    guifg=NONE          guibg=#8cbee2')
vim.cmd('hi DiffAdd guifg=#00FF00 guibg=#005500')
vim.cmd('hi DiffDelete guifg=#FF0000 guibg=#550000')
vim.cmd('hi DiffChange guifg=#FFFFFF guibg=#000055')
vim.cmd('hi DiffText guifg=#FFFF00 guibg=#550000')

