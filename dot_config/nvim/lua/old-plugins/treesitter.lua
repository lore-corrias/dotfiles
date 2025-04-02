require("nvim-treesitter.configs").setup({
  ensure_installed = { "markdown", "markdown_inline", "python", "bash" },
  highlight = {
    enable = true,
  },
})
