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
    "jedi_language_server",
    "java_language_server",
    "jdtls",
    "jsonls",
    "lemminx",
    "marksman",
    "quick_lint_js",
    "sqlls",
    "tsserver",
    "yamlls",
  }
})
