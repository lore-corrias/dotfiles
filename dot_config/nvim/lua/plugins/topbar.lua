return {
  {
    'romgrk/barbar.nvim',
    event = "VeryLazy",
    cmd = {"BufferPrevious", "BufferNext"}, -- lazy load on buffer movement
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    keys = {
      { 'H', '<cmd>BufferPrevious<CR>', desc = 'Move to the left buffer' },
      { 'L', '<cmd>BufferNext<CR>', desc = 'Move to the right buffer' },
      { '<leader>bd', '<cmd>BufferClose<CR>', desc = 'Close current buffer' },
    },
  },
}

