return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "python", "rust", "javascript", "html", "regex" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
          compilers = { "gcc" },
        })
    end,
  },
}
