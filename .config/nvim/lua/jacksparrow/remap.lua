vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.api.nvim_set_keymap("n", "<S-l>", "<CMD>BufferLineCycleWindowlessNext<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", "<CMD>BufferLineCycleWindowlessPrev<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-t>", "<CMD>BufferLineCycleWindowlessToggle<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', '<Cmd>BufferClose<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>SFMToggle<cr>', { noremap = true, silent = true })

vim.cmd[[
	nnoremap G Gzz
	nnoremap o zzo
]]


-- Yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')  -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P')  -- paste before cursor

-- noice keymaps
vim.keymap.set("n", "<leader>nl", function()
  require("noice").cmd("last")
end)
vim.keymap.set("n", "<leader>nh", function()
  require("noice").cmd("history")
end)
vim.keymap.set("n", "<leader>nd", function()
  require("noice").cmd("dismiss")
end)
vim.api.nvim_set_keymap('n', '<leader>nt', ':Telescope notify<CR>', { noremap = true, silent = true })


-- oil.nvim
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
