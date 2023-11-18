-- Wrap text and indent properly
vim.opt.wrap = true
vim.opt.breakindent = true

-- Allow j/k when navigating wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Spell check
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
