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

    -- LSP/JDTLS
    vim.keymap.set('n', '<leader>go', "<cmd>lua require('jdtls').organize_imports()<CR>", opts)
    vim.keymap.set('n', '<leader>gb', "<cmd>lua require('jdtls').update_projects_config()<CR>", opts)
    vim.keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
    vim.keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
    vim.keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)

    -- Testing
    vim.keymap.set("n", "<leader>tc", "<cmd>lua require('jdtls').test_class()<CR>", opts)
    vim.keymap.set("n", "<leader>tm", "<cmd>lua require('jdtls').test_nearest_method()<CR>", opts)

    -- Debugging
    -- nvim-dap
    vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
    vim.keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
    vim.keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
    vim.keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", opts)
    vim.keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', opts)
    vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
    vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", opts)
    vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", opts)
    vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", opts)
    vim.keymap.set("n", '<leader>dd', "<cmd>lua require'dap'.disconnect()<cr>", opts)
    vim.keymap.set("n", '<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", opts)
    vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
    vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
    vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end, opts)
    vim.keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end, opts)
    vim.keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>', opts)
    vim.keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>', opts)
    vim.keymap.set("n", '<leader>de', function() builtin.diagnostics({default_text=":E:"}) end, opts)
end)

lsp.skip_server_setup({'jdtls'})

lsp.setup()

