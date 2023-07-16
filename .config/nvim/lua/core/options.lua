local opt = vim.opt

-- session management
opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- consider - as part of keyword
opt.iskeyword:append("-")

-- disable the mouse while in nvim
opt.mouse = ""

-- folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

