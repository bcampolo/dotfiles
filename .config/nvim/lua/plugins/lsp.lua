-- LSP
return {
  -- LSP Configuration
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Manager Plugins
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "html",
        "gradle_ls",
        "groovyls",
        "lua_ls",
        "intelephense",
        "jdtls",
        "jsonls",
        "lemminx",
        "marksman",
        "quick_lint_js",
        "tsserver",
        "yamlls",
      }
    })

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    -- Setup each LSP server
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        -- Don't setup JDTLS Java LSP because it will be setup from a separte config
        if server_name ~= 'jdtls' then
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end
      end
    })

    -- Lua LSP
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }
  end
}

