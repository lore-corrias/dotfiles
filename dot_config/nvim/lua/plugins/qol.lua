return {
  -- General QoL
  { "numToStr/Comment.nvim" },
  { "nvim-lua/plenary.nvim" },
  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true }, -- manage big files
      explorer = { enabled = true }, -- alternative to nvim-tree
      indent = { enabled = true }, -- show indentation lines
      picker = { enabled = true }, -- fzf picker
    },
    keys = {
      { "<leader>e",  function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  }
  -- { 
  --   "nvim-telescope/telescope.nvim",
  --   keys = {
  --     { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
  --     { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = 'Telescope live grep' },
  --   }
  -- },
}
