local vim = vim
local Plug = vim.fn["plug#"]

-- Various changes
vim.g.mapleader = " "
vim.wo.number = true

vim.call("plug#begin")

-- Plugins
-- Colorscheme
Plug("catppuccin/nvim")

-- Fzf
Plug("junegunn/fzf")

-- Mason
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

-- Linter
Plug('mfussenegger/nvim-lint')

-- Telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ["tag"] = '0.1.8' })

-- On-demand loading: loaded when the specified command is executed
Plug("preservim/nerdtree", { ["on"] = "NERDTreeToggle" })

-- Pairing "" and other chars
Plug("echasnovski/mini.pairs")

-- Which-key, to remember key bindings
Plug('folke/which-key.nvim')

Plug('lewis6991/gitsigns.nvim')

vim.call("plug#end")

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
vim.cmd("silent! colorscheme catppuccin-macchiato")

-- Key bindings
require('binds')

