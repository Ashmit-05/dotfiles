require("jacksparrow.remap")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set scrolloff=4")
vim.cmd("colorscheme tokyonight")

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

-- Function to apply transparency
local function set_transparency()
  -- Telescope transparency
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = 'none' })

  -- Noice transparency
  vim.api.nvim_set_hl(0, 'NoicePopup', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NoiceCmdlinePopup', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NoicePopupBorder', { bg = 'none' })

  -- Notify transparency
  vim.api.nvim_set_hl(0, 'NotifyERROR', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NotifyWARN', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NotifyINFO', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NotifyDEBUG', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NotifyTRACE', { bg = 'none' })

  -- Nui transparency
  vim.api.nvim_set_hl(0, 'NuiPopupBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NuiPopupNormal', { bg = 'none' })

  -- Barbar transparency
  vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferCurrentMod', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferCurrentTarget', { bg = 'none' })

  vim.api.nvim_set_hl(0, 'BufferVisible', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferVisibleIndex', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferVisibleMod', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferVisibleSign', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferVisibleTarget', { bg = 'none' })

  vim.api.nvim_set_hl(0, 'BufferInactive', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferInactiveIndex', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferInactiveMod', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferInactiveSign', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferInactiveTarget', { bg = 'none' })

  vim.api.nvim_set_hl(0, 'BufferTabpages', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = 'none' })

	  -- Barbecue transparency
  vim.api.nvim_set_hl(0, 'WinBar', { bg = 'none' })            -- Main winbar
  vim.api.nvim_set_hl(0, 'WinBarNC', { bg = 'none' })          -- Non-current windows' winbar
  vim.api.nvim_set_hl(0, 'BarbecueSeparator', { bg = 'none' }) -- Barbecue's separator
  vim.api.nvim_set_hl(0, 'BarbecueModified', { bg = 'none' })
end

-- Apply transparency on startup and every colorscheme change
vim.api.nvim_create_autocmd({"VimEnter", "ColorScheme"}, {
  callback = function()
    set_transparency()
  end
})

