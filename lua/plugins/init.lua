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
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end
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
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        auto_load = true,
        theme = "dark",
        app = "browser",
      })
      vim.api.nvim_create_user_command("PeekO", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekC", require("peek").close, {})
    end,
  },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  { 'nvim-mini/mini.icons', version = '*' },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
}
