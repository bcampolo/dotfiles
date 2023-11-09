local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
  augroup end
]])

-- Set .cs filetype to use rust syntax hilighting (closest to torquescript)
vim.cmd([[
  autocmd BufNewFile,BufRead *.cs setfiletype rust
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'nvim-lua/plenary.nvim'
  use 'christoomey/vim-tmux-navigator' -- navigate vim and tmux with vim bindings
  use 'szw/vim-maximizer' -- maximize and restore current window
  use 'nvim-tree/nvim-web-devicons' -- icons for file explorer
  use 'nvim-tree/nvim-tree.lua' -- file explorer
  -- lualine status line with LSP progress
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'linrongbin16/lsp-progress.nvim',
    },
  }
  use {
    'linrongbin16/lsp-progress.nvim',
    requires = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('lsp-progress').setup()
    end
  }
  use({ "nvim-telescope/telescope-fzf-native.nvim", run="make" }) -- telescope - performance improvement
  use({ "nvim-telescope/telescope.nvim", branch="0.1.x" }) -- telescope - fuzzy finder
  use 'ThePrimeagen/harpoon' -- harpoon list of favorite files
  use 'tpope/vim-commentary' -- comment lines of code
  -- auto-completion of bracket/paren/quote pairs
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- treesitter syntax hilighting
  use ({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end
  })
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- treesitter additional motions (e.g. functions)
  -- auto-completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  -- Linting
  use 'mfussenegger/nvim-lint'
  -- LSP server management
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'onsails/lspkind.nvim'
  use 'mfussenegger/nvim-jdtls' -- java jdtls integration with nvim
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
  -- Debugging
  use 'mfussenegger/nvim-dap' -- debug adapter protocol
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} } -- debugger ui
  use 'theHamsta/nvim-dap-virtual-text' -- inline variable text while debugging
  use 'nvim-telescope/telescope-dap.nvim' -- telescope integration with dap

  -- REST / Postman
  use 'diepm/vim-rest-console'

  -- Git
  use 'f-person/git-blame.nvim'

  -- ChatGPT
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })

  -- Theme/Colorscheme
  use 'rebelot/kanagawa.nvim' -- good, but very mellow low-constrast colors - 7.5
  -- use 'projekt0n/github-nvim-theme'
  -- use 'NLKNguyen/papercolor-theme'
  -- use 'nanotech/jellybeans.vim'
  -- use 'tanvirtin/monokai.nvim' -- good - 7.5
  -- use 'sickill/vim-monokai'
  -- use 'srcery-colors/srcery-vim'
  -- use 'morhetz/gruvbox'
  -- use 'sjl/badwolf'
  -- use 'w0ng/vim-hybrid'
  -- use 'tomasiser/vim-code-dark'
  -- use 'folke/tokyonight.nvim' -- good, but very cool temp colors - 7.0
  -- use 'sainnhe/gruvbox-material' -- good, very earthy, greens and tans - 6.75
  -- use 'sainnhe/sonokai' -- good - 6.0
  -- use 'catppuccin/nvim'
  -- use 'bluz71/vim-moonfly-colors'
  -- use 'rafamadriz/neon'
  -- use 'ayu-theme/ayu-vim'

  -- Vim Tutorial Game
  use 'ThePrimeagen/vim-be-good'

  -- XML Format/Minify
  use 'j16180339887/XML-fast.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

