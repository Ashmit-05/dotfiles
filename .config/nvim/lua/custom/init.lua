local opt = vim.opt

opt.relativenumber = true

-- Remap j to jzz and G to Gzz
vim.cmd [[
    " nnoremap j jzz
    " nnoremap k kzz
    nnoremap G Gzz
    nnoremap o zzo
]]

vim.opt.scrolloff = 8

-- -- Transparent Background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
