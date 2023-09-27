local telescope = require('telescope')

local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<S-Tab>"] = actions.move_selection_previous,
        ["<Tab>"] = actions.move_selection_next,
      }
    },
    layout_config = {
      vertical = {
        width = 0.75
      }
    }
  }
})
