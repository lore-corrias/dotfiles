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
        -- Installing harper, which performs grammar checks
        ensure_installed = { "harper-ls" },
      }

      require("mason-lspconfig").setup_handlers {
        -- Default handler (setups the server without any more info)
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- Specific handlers
        -- ["rust_analyzer"] = function ()
        --     require("rust-tools").setup {}
        -- end
      }
    end,
    -- Some bindings to navigate through errors more quickly
    keys = {
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Open code actions" },
      { "<leader>cr", function() vim.lsp.buf.rename() end, desc = "Open diagnostics" },
      { "<leader>cd", function() vim.diagnostic.open_float() end, desc = "Open diagnostics" },
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

return {
  mason,
  masonlsp,
  rust
}
