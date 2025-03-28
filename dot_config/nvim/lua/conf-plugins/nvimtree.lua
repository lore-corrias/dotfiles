local api = require("nvim-tree.api")

require'nvim-tree'.setup({
  filters = {
    dotfiles = false,
  },
  -- navigation in ARIA mode, opening file on right hit
  -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#basic-aria-navigation-arrows-and-vim-keys
  on_attach = function (bufnr)
      local opts = { buffer = bufnr }
      api.config.mappings.default_on_attach(bufnr)
      -- function for left to assign to keybindings
      local lefty = function ()
          local node_at_cursor = api.tree.get_node_under_cursor()
          -- if it's a node and it's open, close
          if node_at_cursor.nodes and node_at_cursor.open then
              api.node.open.edit()
          -- else left jumps up to parent
          else
              api.node.navigate.parent()
          end
      end
      -- function for right to assign to keybindings
      local righty = function ()
          local node_at_cursor = api.tree.get_node_under_cursor()
          api.node.open.edit()
      end
      vim.keymap.set("n", "h", lefty , opts )
      vim.keymap.set("n", "<Left>", lefty , opts )
      vim.keymap.set("n", "<Right>", righty , opts )
      vim.keymap.set("n", "l", righty , opts )
    end,
})
