return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    version = false,
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- instructions_file = "avante.md",
      provider = "copilot",
      providers = {
        gemini = {
          model = "gemini-2.5-flash", 
          temperature = 0,
          max_tokens = 4096,
        },
        copilot = {
          model = "gpt-4o-2024-08-06",
          temperature = 0,
        },
      },
      selector = {
        exclude_auto_select = { "NvimTree" },
      },
    },
    keys = {
      {
          "<leader>a+",
          function()
              local tree_ext = require("avante.extensions.nvim_tree")
              tree_ext.add_file()
          end,
          desc = "Select file in NvimTree",
          ft = "NvimTree",
      },
      {
          "<leader>a-",
          function()
              local tree_ext = require("avante.extensions.nvim_tree")
              tree_ext.remove_file()
          end,
          desc = "Deselect file in NvimTree",
          ft = "NvimTree",
      },
    },
    input = {
      provider = "snacks",
      provider_opts = {
        title = "Avante Input",
        icon = " ",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-mini/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
  }
}
