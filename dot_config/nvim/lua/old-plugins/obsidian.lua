require("obsidian").setup({
  workspaces = {
    {
      name = "wiki",
      path = "~/Personal/wiki",
    }
  },
  templates = {
    folder = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
})

vim.opt.conceallevel = 2
