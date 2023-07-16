local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 60,
        height = 20,
    }
})

