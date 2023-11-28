-- Theme/Colorscheme
return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    -- Replace this section with your colorscheme-specific settings or just remove for the defaults
    -- background = {
    --   dark = "wave",
    -- },
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd("colorscheme kanagawa")
    -- Colorscheme overrides
    vim.cmd([[
      autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
      autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
      autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
      autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
    ]])
  end
}

