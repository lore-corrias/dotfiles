vim.g.mapleader = " "

-- Misc
vim.keymap.set("n", '<leader>S', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<leader>q', ':q<CR>', { noremap = true, silent = true })

vim.keymap.set("n", '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- LSP bindings for lazy ppl
-- vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
-- vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>")
