local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('catppuccin/nvim')

-- Use 'dir' option to install plugin in a non-default directory
-- Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })

Plug('nvim-tree/nvim-tree.lua')

--- For a vscode-like top bar
Plug('nvim-tree/nvim-web-devicons')
Plug('lewis6991/gitsigns.nvim')
Plug('romgrk/barbar.nvim')

-- Lsp and stuff
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate'})

-- Completion
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

--- General QoL
Plug('numToStr/Comment.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

-- Language specifics
Plug('mrcjkb/rustaceanvim')

vim.call('plug#end')
