-- File explorer
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
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
  },
  config = function (_, opts)
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup(opts)
  end
}

