local mason = {
  {
    "williamboman/mason.nvim",
    init = function() require("mason").setup() end,
    cmd = "Mason"
  }
}

-- Mason lspconfig, with automatic loading
local masonlsp = {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    -- load only if we've opened a file
    lazy = vim.fn.argc(-1) == 0,
    -- Auto start LSP servers installed with Mason
    -- using a default configuration
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        --ensure_installed = {
          -- Installing harper, which performs grammar checks
        --  "harper_ls",
          -- Trivy scans for misconfigurations, exposed secrets, etc.
        --  "trivy",
        --},
      }

      require("mason-lspconfig").setup_handlers {
        -- Default handler (setups the server without any more info)
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- Specific handlers
        -- https://github.com/mrcjkb/rustaceanvim/blob/master/doc/mason.txt
        ["rust_analyzer"] = function () end
      }
    end,
    -- Some bindings to navigate through errors more quickly
    keys = {
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Open code actions" },
      { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Open diagnostics" },
      { "<leader>cd", function() vim.diagnostic.open_float() end, desc = "Open diagnostics" },
      { "<leader>hh", function() vim.diagnostic.hover() end, desc = "Open hover menu" },
    }
  }
}

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
  rust
}
