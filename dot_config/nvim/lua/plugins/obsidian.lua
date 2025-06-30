-- For obsidian
vim.opt.conceallevel = 2

local obsidian_workspaces = {
  {{ if eq .chezmoi.username "lorenzo" }}"~/bachelor-thesis",{{ else }}"~/Personal/wiki/uni/tesi"{{ end }}
}

-- Render markdown only if the file is not inside an Obsidian vault
local markdown_render = {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = {'markdown', 'avante'},
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  -- enable only if not in Obsidian vault
  -- enabled = function()
  --   local cwd = vim.fn.getcwd()
  --   for _, path in ipairs(obsidian_workspaces) do
  --     if cwd:match(vim.fn.expand(path)) then
  --       return false
  --     end
  --   end
  --   return true
  -- end,
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = { "markdown", "avante" },
    heading = {
      enabled = true,
      setext = true,
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
      signs = { '󰫎 ' },
      width = 'block',
    },
    paragraph  = { enabled = false },
    -- code       = { enabled = true },
    -- dash       = { enabled = true },
    -- bullet     = { enabled = true },
    -- checkbox   = { enabled = true },
    quote      = { enabled = false },
    -- pipe_table = { enabled = true },
    callouts   = { enabled = false },
    links      = { enabled = false },
    -- signs      = { enabled = true },
    indent     = { enabled = false },
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
      enabled = true,
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
  },
}

return {
  markdown_render,
  obsidian,
}
