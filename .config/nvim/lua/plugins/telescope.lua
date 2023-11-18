-- Fuzzy finder
return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<S-Tab>"] = require('telescope.actions').move_selection_previous,
          ["<Tab>"] = require('telescope.actions').move_selection_next,
        }
      },
      layout_config = {
        vertical = {
          width = 0.75
        }
      }
    }
  }
}
