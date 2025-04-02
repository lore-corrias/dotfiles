return {
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
}
