local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  highlight = {
    enable = true
  },
  indent = { enable = true },
  autotag = { enable = true };
  ensure_installed = {
    "bash",
    "cpp",
    "css",
    "dockerfile",
    "java",
    "javascript",
    "json",
    "gitignore",
    "html",
    "lua",
    "markdown",
    "tsx",
    "typescript",
    "rust",
    "vim",
    "yaml",
  },
  auto_install = true,
})
