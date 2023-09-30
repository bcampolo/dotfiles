local lsp = require('lsp-zero').preset({})

local lspconfig = require('lspconfig')
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

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr}
end)

lsp.skip_server_setup({'jdtls'})

lsp.setup()

