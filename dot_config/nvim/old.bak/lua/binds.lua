-- Various
vim.keymap.del({ "i", "n" }, "<leader>s")
vim.keymap.set({ "i" }, "<leader>S", "<C-o>:w<ENTER>")
vim.keymap.set({ "n" }, "<leader>S", ":w<ENTER>")
vim.keymap.del({ "n", "i" }, "<C-s>")

-- telescope binds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- NerdTree
vim.keymap.set("n", "<leader>e", ":NERDTreeToggle<CR>", { desc = "Toggle NERD Tree" })
