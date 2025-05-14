local mason = {
  {
    "williamboman/mason.nvim",
    init = function() require("mason").setup() end,
    lazy = false,
  }
}

local lspconfig = {
  {
    "neovim/nvim-lspconfig",
  }
}

-- Mason lspconfig, with automatic loading
local masonlsp = {
  {
    "williamboman/mason-lspconfig.nvim",
    after = { "mason.nvim", "nvim-lspconfig" },
    -- load only if we've opened a file
    lazy = false,
    -- Auto start LSP servers installed with Mason
    -- using a default configuration
    config = function()
      require("mason").setup {}
      require("mason-lspconfig").setup {
        auto_enable = true,
        ensure_installed = { "eslint-lsp", "ruff", "pyright", "eslint_d" },
      }
    end,
    -- Some bindings to navigate through errors more quickly
    keys = {
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Open code actions" },
      { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Open diagnostics" },
      { "<leader>hh", function() vim.lsp.buf.hover() end, desc = "Open hover menu" },
      { "<leader>cf", function() vim.lsp.buf.format() end, desc = "Open hover menu" },
      { "<leader>cd", function() vim.diagnostic.open_float() end, desc = "Open diagnostics" },
    }
  }
}

-- Automatic formatting on save
vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = buffer,
  callback = function()
      vim.lsp.buf.format { async = false }
  end
})

-- Configuration specific to Rust
local rust = {
  {
    "mrcjkb/rustaceanvim" ,
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  }
}

-- Setting up rustaceanvim to use Mason w/ rust-analyzer
-- vim.g.rustaceanvim = {
--   server = {
--     cmd = function()
--       local mason_registry = require('mason-registry')
--       if mason_registry.is_installed('rust-analyzer') then
--         -- This may need to be tweaked depending on the operating system.
--         local ra = mason_registry.get_package('rust-analyzer')
--         local ra_filename = ra:get_receipt():get().links.bin['rust-analyzer']
--         return { ('%s/%s'):format(ra:get_install_path(), ra_filename or 'rust-analyzer') }
--       else
--         -- global installation
--         return { 'rust-analyzer' }
--       end
--     end,
--   },
-- }

return {
  mason,
  masonlsp,
  lspconfig,
  rust
}
