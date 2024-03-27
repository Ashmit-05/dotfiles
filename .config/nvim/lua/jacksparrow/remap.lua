vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.api.nvim_set_keymap("n", "<S-l>", "<CMD>BufferLineCycleWindowlessNext<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", "<CMD>BufferLineCycleWindowlessPrev<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-t>", "<CMD>BufferLineCycleWindowlessToggle<CR>",
    { noremap = true, silent = true })

vim.keymap.set('n', '<C-u>', vim.cmd.UndotreeToggle)

vim.api.nvim_set_keymap('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', '<Cmd>BufferClose<CR>', {noremap = true, silent = true})
