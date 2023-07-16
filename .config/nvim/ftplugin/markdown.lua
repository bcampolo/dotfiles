local opt = vim.opt

-- line wrapping
opt.wrap = true
opt.breakindent = true
-- opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
-- opt.linebreak = true

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

