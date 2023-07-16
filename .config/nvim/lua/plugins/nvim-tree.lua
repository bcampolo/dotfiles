local nvimtree = require('nvim-tree')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  actions = {
    open_file = {
      window_picker = {
        enable = false
      },
      -- quit_on_open = true, 
    }
  },
  -- filters = {
  --   custom = { 'client' },
  -- },

})

