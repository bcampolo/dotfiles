local mason = require('mason')

local mason_lspconfig = require('mason-lspconfig')

mason.setup()

mason_lspconfig.setup({
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
    -- "yamlls",
  }
})
