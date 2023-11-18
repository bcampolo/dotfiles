-- List of favorite files per project
return {
  'ThePrimeagen/harpoon',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    menu = {
      -- width = vim.api.nvim_win_get_width(0) - 20
      width = 120
    }
  },
}

