return {
  'cameron-wags/rainbow_csv.nvim',
  ft = {
    'csv',
    'tsv',
    'csv_semicolon',
    'csv_whitespace',
    'csv_pipe',
    'rfc_csv',
    'rfc_semicolon'
  },
  config = function()
    require('rainbow_csv').setup()
    vim.g.rcsv_colorpairs = { {'darkred', '#FF5d62'}, {'blue', '#3A80F2'}, {'green', '#B6F3A1'}, {'magenta', '#FF9CA4'}, {'NONE', '#EEEEEE'}, {'red', '#FF8F61'}, {'darkmagenta', '#BFA3E6'}, {'darkblue', '#E9D27F'}, {'darkgreen', '#6CAF60'}, {'darkcyan', '#89B4FA'} }
  end
}
