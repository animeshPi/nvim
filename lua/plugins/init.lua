return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.filters = opts.filters or {}
      opts.filters.git_ignored = false

      opts.git = opts.git or {}
      opts.git.ignore = false
    end,
  },

  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
        highlight = "IblIndent",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = "IblScope",
      },
      whitespace = {
        remove_blankline_trail = false,
      },
    },
    config = function(_, opts)
      -- keep NvChad's base46 highlight cache if present
      pcall(dofile, vim.g.base46_cache .. "blankline")

      -- dots for leading (indentation) spaces only
      vim.opt.list = true
      vim.opt.listchars = {
        lead = "·",
        tab = "│ ",
        trail = " ",
      }

      -- Blend the theme's text color into its background.
      -- amount: 0..1, smaller = closer to background = more subtle
      local function blend(bg, fg, amount)
        local function channel(shift)
          local b = bit.band(bit.rshift(bg, shift), 0xff)
          local f = bit.band(bit.rshift(fg, shift), 0xff)
          return math.floor(b + (f - b) * amount + 0.5)
        end
        return string.format("#%02x%02x%02x", channel(16), channel(8), channel(0))
      end

      local function apply_highlights()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
        local bg = normal.bg or 0x1e222a -- fallback for transparent backgrounds
        local fg = normal.fg or 0xabb2bf

        vim.api.nvim_set_hl(0, "IblIndent", { fg = blend(bg, fg, 0.12), nocombine = true })
        vim.api.nvim_set_hl(0, "IblScope", { fg = blend(bg, fg, 0.25), nocombine = true })
        vim.api.nvim_set_hl(0, "Whitespace", { fg = blend(bg, fg, 0.09) })
      end

      apply_highlights()

      -- re-apply after theme changes (plain colorscheme and NvChad's theme switcher)
      vim.api.nvim_create_autocmd({ "ColorScheme", "User" }, {
        pattern = { "*", "NvChadThemeReload" },
        callback = function()
          vim.schedule(apply_highlights)
        end,
      })

      require("ibl").setup(opts)
    end,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,  -- load immediately
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Git status
      map("n", "<leader>gs", ":Git<CR>", opts)
      -- Stage current file
      map("n", "<leader>gc", ":Gwrite<CR>", opts)
      -- Show blame
      map("n", "<leader>gb", ":Gblame<CR>", opts)
      -- Git log for current file
      map("n", "<leader>gl", ":Glog<CR>", opts)
      -- Pull and push
      map("n", "<leader>gp", ":Git pull<CR>", opts)
      map("n", "<leader>gP", ":Git push<CR>", opts)
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = "31%",
            col = "50%",
          },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "rust",
        "cpp",
        "c",
        "python",
        "javascript",
        "typescript",
  		},
  	},
  },
}
