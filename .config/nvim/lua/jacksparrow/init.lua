require("jacksparrow.remap")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set scrolloff=4")
vim.cmd("colorscheme catppuccin")

-- Set tabstop and shiftwidth to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Enable mouse support
vim.opt.mouse = "a"

-- Set netrw list style to tree view (style 3)
vim.cmd("let g:netrw_liststyle = 3")

vim.cmd("let g:netrw_browse_split = 4")
vim.cmd("let g:netrw_winsize = 20")

-- persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
