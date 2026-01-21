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
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
