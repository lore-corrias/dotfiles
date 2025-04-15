return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = false,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "python", "rust", "javascript", "html", "regex" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end,
  },
}
