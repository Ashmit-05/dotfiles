local opt = vim.opt

opt.relativenumber = true

-- Remap j to jzz and G to Gzz
vim.cmd [[
    nnoremap j jzz
    nnoremap k kzz
    nnoremap G Gzz
]]

