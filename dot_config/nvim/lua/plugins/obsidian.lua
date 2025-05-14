-- For obsidian
vim.opt.conceallevel = 2

-- Render markdown
local markdown_render = {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    heading = {
      -- Turn on / off heading icon & background rendering.
      enabled = true,
      -- Turn on / off atx heading rendering.
      atx = true,
      -- Turn on / off setext heading rendering.
      setext = true,
      -- Turn on / off any sign column related rendering.
      sign = true,
      -- Replaces '#+' of 'atx_h._marker'.
      -- Output is evaluated depending on the type.
      -- | function | `value(context)`              |
      -- | string[] | `cycle(value, context.level)` |
      icons = { ' I ', ' II ', ' III ', ' IV ', ' V ', ' VI ' },
      -- Determines how icons fill the available space.
      -- | right   | '#'s are concealed and icon is appended to right side                          |
      -- | inline  | '#'s are concealed and icon is inlined on left side                            |
      -- | overlay | icon is left padded with spaces and inserted on left hiding any additional '#' |
      position = 'overlay',
      -- Added to the sign column if enabled.
      -- Output is evaluated by `cycle(value, context.level)`.
      signs = { '󰫎 ' },
      -- Width of the heading background.
      -- | block | width of the heading text |
      -- | full  | full width of the window  |
      -- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
      width = 'block',
    },
  },
}

local obsidian = {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/Personal/wiki/uni/tesi",
      },
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
    ui = {
      enabled = false,
    }
  },
}

return {
  -- markdown_render,
  obsidian,
}
