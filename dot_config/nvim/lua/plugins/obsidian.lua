-- For obsidian
vim.opt.conceallevel = 1

return {
  -- Render markdown
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you use the mini.nvim suite
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {},
  -- },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    cmd = "Obsidian",
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre"
    --     .. vim.fn.expand("~")
    --     .. "/Personal/Notes/public/*.md",
    --   -- "BufReadPre" .. vim.fn.expand("~") .. "/Personal/Notes/private/*.md",
    --   "BufNewFile"
    --     .. vim.fn.expand("~")
    --     .. "/Personal/Notes/public/*.md",
    --   -- "BufNewFile" .. vim.fn.expand("~") .. "/Personal/Notes/private/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    opts = {
      workspaces = {
        {
          name = "ctf",
          path = "~/Personal/ctfs/notes",
        },
        {
          name = "uni",
          path = "~/Personal/wiki/uni",
        },
        {
          name = "tesi",
          path = "~/Personal/wiki/uni/tesi/notes",
        },
        --
        -- {
        --   name = "private",
        --   path = "~/Personal/Notes/private",
        -- },
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      completion = {
        blink = true,
        nvim_cmp = false,
      },
      -- ui = {
      --   enabled = false,
      -- }
    },
  },
}
