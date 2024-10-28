return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  enabled = function()
    return LazyVim.has("telescope.nvim")
  end,
  config = function()
    require("venv-selector").setup({
      settings = {
        search = {
          anaconda_base = {
            command = "fd /python$ /opt/conda/envs --full-path --color never -E /proc",
            type = "anaconda",
          },
        },
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    })
  end,
  event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
  },
}
