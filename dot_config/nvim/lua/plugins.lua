return {
  {
    "catppuccin/nvim",
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },

  -- Top-bar
  { "nvim-tree/nvim-web-devicons" },
  { "lewis6991/gitsigns.nvim" },
  { "romgrk/barbar.nvim" },

  -- LSP, Linters, Formatters installer
  { "williamboman/mason.nvim" },
  -- Linting, Formatting, LSP Management
  { "dense-analysis/ale" },
  -- Syntax Highlighting
  { "nvim-treesitter/nvim-treesitter" },
  -- Completion
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  -- Snippets
  { "L3MON4D3/LuaSnip", version = "v2.*" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Sessions
  { "rmagatti/auto-sessions" },
}

-- local Plug = vim.fn['plug#']
--
-- vim.call('plug#begin')
--
-- { "catppuccin/nvim" },
--
-- -- Use 'dir' option to install plugin in a non-default directory
-- -- Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })
--
-- -- Vim-wiki
-- { "vimwiki/vimwiki" },
--
-- { "nvim-tree/nvim-tree.lua" },
--
-- --- For a vscode-like top bar
-- { "nvim-tree/nvim-web-devicons" },
-- { "lewis6991/gitsigns.nvim" },
-- { "romgrk/barbar.nvim" },
--
-- -- Lsp and stuff
-- { "williamboman/mason.nvim" },
-- { "dense-analysis/ale" },
--
-- -- Treesitter
-- Plug('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate'})
--
-- -- Completion
--
-- -- Sessions
-- { "rmagatti/auto-session" },
--
--
-- --- General QoL
-- { "numToStr/Comment.nvim" },
-- { "nvim-lua/plenary.nvim" },
-- { "nvim-telescope/telescope.nvim" },
-- -- { "nvim-telescope/telescope-ui-select.nvim" },
--
-- -- Language specifics
-- { "mrcjkb/rustaceanvim" },
--
-- -- Git stuff
-- { "airblade/vim-gitgutter" },
-- { "tpope/vim-fugitive" },
--
-- vim.call('plug#end')
