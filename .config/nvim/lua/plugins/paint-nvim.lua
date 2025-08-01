return {
  -- https://github.com/folke/paint.nvim
  'folke/paint.nvim',
  event = 'VeryLazy',
  opts = {
    highlights = {
      {
        filter = { filetype = "markdown" },
        pattern = "(SOURCE)",
        hl = "@comment.warning",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(╭───╮)",
        hl = "@property",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(│)",
        hl = "@property",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(╰───╯)",
        hl = "@property",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(GPIO%w+)",
        hl = "lualine_a_normal",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(GROUND)",
        hl = "lualine_a_inactive",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(+3V3)",
        hl = "@comment.warning",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(.5V)",
        hl = "@comment.error",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(VBUS)",
        hl = "@comment.error",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(VSYS)",
        hl = "@comment.error",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "RUN",
        hl = "lualine_a_visual",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "3V3_EN",
        hl = "lualine_a_visual",
      },
    },
  }
}
