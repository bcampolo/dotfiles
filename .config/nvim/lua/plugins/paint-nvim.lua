return {
  'folke/paint.nvim',
  event = 'VeryLazy',
  opts = {
    highlights = {
      {
        filter = { filetype = "markdown" },
        pattern = "(╭───╮)",
        hl = "@text.reference",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(│)",
        hl = "@text.reference",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(╰───╯)",
        hl = "@text.reference",
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
        pattern = "(.3V3)",
        hl = "@text.warning",
      },
      {
        filter = { filetype = "markdown" },
        pattern = "(.5V)",
        hl = "@text.danger",
      },
    },
  }
}
