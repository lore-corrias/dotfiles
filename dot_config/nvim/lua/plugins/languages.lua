return {
  -- LSP, Linters, Formatters installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- lazyload with mason command
    init = function() require("mason").setup() end,
  },
  -- Linting, Formatting, LSP Management
  {
    "dense-analysis/ale",
    opts = function()
      -- Ale"s default floating window is ugly
      vim.g.ale_hover_to_floating_preview = 1
      vim.g.ale_completion_enabled         = 1
      vim.g.ale_completion_delay           = 300
      vim.g.ale_completion_max_suggestions = 50
      -- linting
      vim.g.ale_lint_on_save               = 1
      vim.g.ale_lint_on_text_changed       = 'always'
      vim.g.ale_lint_delay                 = 900
      -- fixing
      vim.g.ale_fix_on_save                = 1
      -- messages
      vim.g.ale_echo_msg_error_str         = 'E'
      vim.g.ale_echo_msg_warning_str       = 'W'
      vim.g.ale_echo_msg_info_str          = 'I'
      vim.g.ale_echo_msg_format            = '[%severity%:%code%](%linter%): %s'
      vim.g.ale_set_highlights             = 1
      vim.g.ale_virtualtext_cursor         = 0
      vim.g.ale_virtualtext_delay          = 1
      -- symbols
      vim.g.ale_sign_error                 = '×'
      vim.g.ale_sign_warning               = '▸'
      -- hover
      vim.g.ale_hover_cursor               = 1
      vim.g.ale_hover_to_preview           = 1
      vim.g.ale_set_balloons               = 0
      vim.g.ale_hover_to_floating_preview  = 1
      vim.g.ale_detail_to_floating_preview = 1
      vim.g.ale_floating_preview           = 1
      vim.g.ale_floating_window_border     = {"│", "─", "╭", "╮", "╯", "╰", "│", "─"}
    end,
    keys = {
      { "K", "<cmd>ALEHover<CR>", noremap = true, silent = true },
      { "D", "<cmd>ALEDetail<CR>", noremap = true, silent = true }
    }
  },
  -- Syntax Highlighting
  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- Completion
  { 
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      -- Snippets
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      { "saadparwaiz1/cmp_luasnip" },
    },
    opts = function()
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {

        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
      local auto_select = true

	    return {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

            -- For `mini.snippets` users:
            -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
            -- insert({ body = args.body }) -- Insert at cursor
            -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
            -- require("cmp.config").set_onetime({ sources = {} })
          end,
	      },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
                 ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' }, -- For vsnip users.
          { name = 'luasnip' }, -- For luasnip users.
                 -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }),
      }
    end,
  },
  -- Language specifics
  {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  }
}
