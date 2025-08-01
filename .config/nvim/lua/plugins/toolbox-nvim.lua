-- Commonly used command picker
return {
  'DanWlker/toolbox.nvim',
  keys = {
    {
      '<leader>tt',
      function()
        require('toolbox').show_picker()
      end,
      desc = '[T]oolbox',
      mode = { 'n', 'v' },
    },
  },
  dependencies = { 'nvim-telescope/telescope.nvim' },
  opts = {
    commands = {
      {
        name = 'Format JSON',
        execute = "%!jq '.'",
      },
      {
        name = 'Format XML',
        execute = ":silent !xmllint --format % --output %",
      },
    },
  },
  config = true,
}
