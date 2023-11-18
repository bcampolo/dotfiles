-- Code tree support and syntax hilighting
return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    highlight = {
      enable = true,
      disable = { "r" }, -- list of language name (not extension) that will be disabled
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
  }
}

