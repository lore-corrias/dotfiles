vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.wiki",
  callback = function()
    vim.bo.filetype = "markdown"
  end,
})
