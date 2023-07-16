local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll forward
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- clear completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp 
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 60,
      ellpsis_char = "...",
    }),
  },
})

