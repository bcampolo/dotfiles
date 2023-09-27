local nvimtree = require('nvim-tree')

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
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

