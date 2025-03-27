local builtin = require('telescope.builtin')

vim.g.mapleader = " "

-- Misc
vim.keymap.set("n", '<leader>S', ':w<CR>')
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- NerdTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- Barbar
vim.keymap.set('n', 'H', ':BufferPrevious<CR>', { desc = 'Move to the left buffer' })
vim.keymap.set('n', 'L', ':BufferNext<CR>', { desc = 'Move to the right buffer' })
vim.keymap.set('n', '<leader>bd', ':BufferClose<CR>', { desc = 'Close current buffer' })
vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Grep buffers with telescope' })
