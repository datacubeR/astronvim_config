return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    'antonk52/markdowny.nvim',
    config = function()
      require('markdowny').setup()
    end,
    ft = { "markdown", "md" },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
  },
  { "lervag/vimtex", event = "User AstroFile" },
  {
    'AckslD/swenv.nvim',
    config = function()
      require("swenv").setup({
        post_set_venv = function()
          vim.cmd("LspRestart")
        end,
      })
    end,
  },
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the mapping part of the table
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" })
      -- return the new table to be used
      return opts
    end,
  }, {
  'luk400/vim-jukit',
  ft = { "python", "ipynb" },
},
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
    event = "VeryLazy"
  },
  {
    "tpope/vim-surround",
    config = function()
    end,
    event = "User AstroFile",
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  {
    'wellle/targets.vim',
    config = function()
    end,
    event = "User AstroFile",
  },
  {
    'michaeljsmith/vim-indent-object',
    config = function()
    end,
    event = "User AstroFile",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- config = function()
    --   require("todo-comments").setup {}
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    }
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      fd_binary_name = "fdfind",
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            dismiss = "<M-BS>",
            next = "<M-n>",
            prev = "<M-h>",
          },
        },
        filetypes = { markdown = true },
      })
    end,
  },
}
