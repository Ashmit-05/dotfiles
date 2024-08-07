-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use('nvim-treesitter/nvim-treesitter', {run=':TSUpdate'})

	use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use {
		"olexsmir/gopher.nvim",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	}

	use('neovim/nvim-lspconfig')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	use('hrsh7th/nvim-cmp')

	use('anott03/nvim-lspinstall')

	use {
		'rmagatti/goto-preview',
		config = function()
			require('goto-preview').setup {}
		end
	}

	use {
		"williamboman/mason.nvim"
	}

	use {
		"williamboman/mason-lspconfig.nvim",
	}

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	})

	use({
		"epwalsh/obsidian.nvim",
		tag = "*",  -- recommended, use latest release instead of latest commit
		requires = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "notes",
						path = "~/Documents/Second Brain/",
					},
				},
				daily_notes = {
					folder = "Daily/",
					format = "%d-%m-%Y",
				},
				note_id_func = function(title)
					local suffix = ""
					if title ~= nil then
						suffix = title:gsub(" ","-"):gsub("[^A-Za-z0-9-]",""):lower()
					else
						for _ = 1,4 do
							suffix = suffix .. string.char(math.random(65,90))
						end
					end
					return tostring(os.time()) .. "-" .. suffix
				end
			})
		end,
	})

	use {
		"christoomey/vim-tmux-navigator",
		config = function()
			vim.api.nvim_set_keymap('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>', { silent = true })
			vim.api.nvim_set_keymap('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>', { silent = true })
			vim.api.nvim_set_keymap('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>', { silent = true })
			vim.api.nvim_set_keymap('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>', { silent = true })
			vim.api.nvim_set_keymap('n', '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>', { silent = true })
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

  use 'nvim-tree/nvim-web-devicons'
	use {
		'lewis6991/gitsigns.nvim',
		config = function ()
			require('gitsigns').setup()
		end
	} -- OPTIONAL: for git status
	use 'romgrk/barbar.nvim'

	-- use {
	-- 	"startup-nvim/startup.nvim",
	-- 	requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	-- 	config = function()
	-- 		require"startup".setup({theme = "startify"})
	-- 	end
	-- }

	use {
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				theme = 'hyper',
				shortcut_type = 'number',
				config = {
					week_header = { enable = true },
					packages = { enable = false },
					project = { enable = false, limit = 2 },
					mru = { limit = 9 },
				}
			}
		end,
		requires = {'nvim-tree/nvim-web-devicons'}
	}

	-- use {
	-- 	'ms-jpq/chadtree',
	-- 	branch = 'chad',
	-- 	run = 'python3 -m chadtree deps'
	-- }

	use {
		'dinhhuy258/sfm.nvim',
		config = function()
			require("sfm").setup()
		end
	}

	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}

	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	})

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use {
		"akinsho/toggleterm.nvim", tag = '*', config = function()
			require("toggleterm").setup()
		end
	}

	use 'mfussenegger/nvim-jdtls'

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

end)
