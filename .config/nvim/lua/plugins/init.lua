-- All plugins have lazy=true by default,to load a plugin on startup just lazy=false
-- List of all default plugins & their definitions
local default_plugins = {

  "nvim-lua/plenary.nvim",

  {
    "NvChad/base46",
    branch = "v3.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "NvChad/ui",
    branch = "v3.0",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "User FilePost",
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return { override = require "nvchad.icons.devicons" }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "devicons")
      require("nvim-web-devicons").setup(opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "plugins.configs.treesitter"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "plugins.configs.gitsigns"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
    end,
  },

  -- lsp stuff
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require "plugins.configs.mason"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("plugins.configs.lspconfig").defaults()
    end,
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "plugins.configs.luasnip"
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    init = function()
      vim.g.comment_maps = true
    end,
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },

  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "plugins.configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Telescope",
    opts = function()
      return require "plugins.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      -- local telescope = require "telescope"
      -- telescope.setup(opts)
      --
      local Layout = require("nui.layout")
      local Popup = require("nui.popup")

      local telescope = require("telescope")
      local TSLayout = require("telescope.pickers.layout")

      local function make_popup(options)
        local popup = Popup(options)
        function popup.border:change_title(title)
          popup.border.set_text(popup.border, "top", title)
        end
        return TSLayout.Window(popup)
      end

      telescope.setup({
        defaults = {
          layout_strategy = "flex",
          layout_config = {
            horizontal = {
              size = {
                width = "90%",
                height = "80%",
              },
            },
            vertical = {
              size = {
                width = "90%",
                height = "90%",
              },
            },
          },
          create_layout = function(picker)
            local border = {
              results = {
                top_left = "┌",
                top = "─",
                top_right = "┬",
                right = "│",
                bottom_right = "",
                bottom = "",
                bottom_left = "",
                left = "│",
              },
              results_patch = {
                minimal = {
                  top_left = "┌",
                  top_right = "┐",
                },
                horizontal = {
                  top_left = "┌",
                  top_right = "┬",
                },
                vertical = {
                  top_left = "├",
                  top_right = "┤",
                },
              },
              prompt = {
                top_left = "├",
                top = "─",
                top_right = "┤",
                right = "│",
                bottom_right = "┘",
                bottom = "─",
                bottom_left = "└",
                left = "│",
              },
              prompt_patch = {
                minimal = {
                  bottom_right = "┘",
                },
                horizontal = {
                  bottom_right = "┴",
                },
                vertical = {
                  bottom_right = "┘",
                },
              },
              preview = {
                top_left = "┌",
                top = "─",
                top_right = "┐",
                right = "│",
                bottom_right = "┘",
                bottom = "─",
                bottom_left = "└",
                left = "│",
              },
              preview_patch = {
                minimal = {},
                horizontal = {
                  bottom = "─",
                  bottom_left = "",
                  bottom_right = "┘",
                  left = "",
                  top_left = "",
                },
                vertical = {
                  bottom = "",
                  bottom_left = "",
                  bottom_right = "",
                  left = "│",
                  top_left = "┌",
                },
              },
            }

            local results = make_popup({
              focusable = false,
              border = {
                style = border.results,
                text = {
                  top = picker.results_title,
                  top_align = "center",
                },
              },
              win_options = {
                winhighlight = "Normal:Normal",
              },
            })

            local prompt = make_popup({
              enter = true,
              border = {
                style = border.prompt,
                text = {
                  top = picker.prompt_title,
                  top_align = "center",
                },
              },
              win_options = {
                winhighlight = "Normal:Normal",
              },
            })

            local preview = make_popup({
              focusable = false,
              border = {
                style = border.preview,
                text = {
                  top = picker.preview_title,
                  top_align = "center",
                },
              },
            })

            local box_by_kind = {
              vertical = Layout.Box({
                Layout.Box(preview, { grow = 1 }),
                Layout.Box(results, { grow = 1 }),
                Layout.Box(prompt, { size = 3 }),
              }, { dir = "col" }),
              horizontal = Layout.Box({
                Layout.Box({
                  Layout.Box(results, { grow = 1 }),
                  Layout.Box(prompt, { size = 3 }),
                }, { dir = "col", size = "50%" }),
                Layout.Box(preview, { size = "50%" }),
              }, { dir = "row" }),
              minimal = Layout.Box({
                Layout.Box(results, { grow = 1 }),
                Layout.Box(prompt, { size = 3 }),
              }, { dir = "col" }),
            }

            local function get_box()
              local strategy = picker.layout_strategy
              if strategy == "vertical" or strategy == "horizontal" then
                return box_by_kind[strategy], strategy
              end

              local height, width = vim.o.lines, vim.o.columns
              local box_kind = "horizontal"
              if width < 100 then
                box_kind = "vertical"
                if height < 40 then
                  box_kind = "minimal"
                end
              end
              return box_by_kind[box_kind], box_kind
            end

            local function prepare_layout_parts(layout, box_type)
              layout.results = results
              results.border:set_style(border.results_patch[box_type])

              layout.prompt = prompt
              prompt.border:set_style(border.prompt_patch[box_type])

              if box_type == "minimal" then
                layout.preview = nil
              else
                layout.preview = preview
                preview.border:set_style(border.preview_patch[box_type])
              end
            end

            local function get_layout_size(box_kind)
              return picker.layout_config[box_kind == "minimal" and "vertical" or box_kind].size
            end

            local box, box_kind = get_box()
            local layout = Layout({
              relative = "editor",
              position = "50%",
              size = get_layout_size(box_kind),
            }, box)

            layout.picker = picker
            prepare_layout_parts(layout, box_kind)

            local layout_update = layout.update
            function layout:update()
              local box, box_kind = get_box()
              prepare_layout_parts(layout, box_kind)
              layout_update(self, { size = get_layout_size(box_kind) }, box)
            end

            return TSLayout(layout)
          end,
        },
      })
            -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end

    end,
  },

  -- Only load whichkey after all the gui
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
    end,
  },
}

local config = require "nvconfig"

if #config.plugins > 0 then
  table.insert(default_plugins, { import = config.plugins })
end

require("lazy").setup(default_plugins, config.lazy_nvim)
