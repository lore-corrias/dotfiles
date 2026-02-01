return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      picker = { enabled = true },
    },
    keys = {
      { "<leader>e",  function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
      { 
        "<leader>a+", 
        function()
          -- 1. Get the running explorer instance
          local picker = Snacks.picker.get({ source = "explorer" })[1]
          if not picker then return vim.notify("Explorer not open") end

          -- 2. Get the selected items (or the item under cursor)
          local to_add = {}
          for _, sel in ipairs(picker:selected()) do
            if sel.file then table.insert(to_add, sel.file) end
          end

          -- Fallback: if nothing selected, get the item under the cursor
          if #to_add == 0 then
            local item = picker:current()
            if item and item.file then table.insert(to_add, item.file) end
          end

          -- 3. Send to Avante
          if #to_add > 0 then
            require("avante.api").ask({ files = to_add }) 
          end
        end,
        desc = "Add file to Avante",
      },
    },
  },
}
