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
  -- Installing Modes
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('neogen').setup {
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention =
              "numpydoc",
            }
          },
        }
      }
    end,
    ft = "python",
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    'mvllow/modes.nvim',
    config = function()
      require('modes').setup()
    end,
    event = "User AstroFile",
  },
  -- Cleaning which-key Menu
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      -- local wk = require("which-key")
      opts.plugins = {
        presets = {
          motions = false,
          operators = false,
          text_objects = false,
          windows = true,
          nav = false,
          g = true,
        }
      }
      opts.layout = {
        align = "center",
        spacing = 8,
      }
      opts.hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua ", }
      opts.key_labels = {
        ["<space>"] = "SPC",
        ["<CR>"] = "ENTER"
      }
      opts.window = { border = "single" }
    end,
  },
  -- Indentation Properties for Python
  {
    "Vimjas/vim-python-pep8-indent",
    ft = { "python", },
  },
  -- Markdown Preview
  -- Add plugins, the Mardown syntax
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
  -- Plugins for Latex
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
  -- General Plugins
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
  -- Python Notebooks in Scripts
  {
    'luk400/vim-jukit',
    event = "User AstroFile",
  },
  -- Virtual Environment Selector for LSP
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
            accept = "<Right>",
            dismiss = "<C-BS>",
            next = "<C-n>",
            prev = "<C-h>",
          },
        },
        filetypes = { markdown = true },
      })
    end,
  },
  -- Big Config to replicate NvChad Statusline
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require("astronvim.utils.status")
      opts.statusline = {
        -- default highlight for the entire statusline
        hl = { fg = "fg", bg = "bg" },
        -- each element following is a component in astronvim.utils.status module

        -- add the vim mode component
        status.component.mode {
          -- enable mode text with padding as well as an icon before it
          mode_text = { icon = { kind = "VimIcon", padding = { right = 1, left = 1 } } },
          -- surround the component with a separators
          surround = {
            -- it's a left element, so use the left separator
            separator = "left",
            -- set the color of the surrounding based on the current mode using astronvim.utils.status module
            color = function() return { main = status.hl.mode_bg(), right = "blank_bg" } end,
          },
        },
        -- we want an empty space here so we can use the component builder to make a new section with just an empty string
        status.component.builder {
          { provider = "" },
          -- define the surrounding separator and colors to be used inside of the component
          -- and the color to the right of the separated out section
          surround = { separator = "left", color = { main = "blank_bg", right = "file_info_bg" } },
        },
        -- add a section for the currently opened file information
        status.component.file_info {
          -- enable the file_icon and disable the highlighting based on filetype
          file_icon = { padding = { left = 0 } },
          filename = { fallback = "Empty" },
          -- add padding
          padding = { right = 1 },
          -- define the section separator
          surround = { separator = "left", condition = false },
        },
        -- add a component for the current git branch if it exists and use no separator for the sections
        status.component.git_branch { surround = { separator = "none" } },
        -- add a component for the current git diff if it exists and use no separator for the sections
        status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },
        -- fill the rest of the statusline
        -- the elements after this will appear in the middle of the statusline
        status.component.fill(),
        -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
        status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
        -- fill the rest of the statusline
        -- the elements after this will appear on the right of the statusline
        status.component.fill(),
        -- add a component for the current diagnostics if it exists and use the right separator for the section
        status.component.diagnostics { surround = { separator = "right" } },
        -- add a component to display LSP clients, disable showing LSP progress, and use the right separator
        status.component.lsp { lsp_progress = false, surround = { separator = "right" } },
        -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
        -- all of the children of this table will be treated together as a single component
        {
          -- define a simple component where the provider is just a folder icon
          status.component.builder {
            -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
            { provider = require("astronvim.utils").get_icon "FolderClosed" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the foreground color to be used for the icon
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            surround = { separator = "right", color = "folder_icon_bg" },
          },
          -- add a file information component and only show the current working directory name
          status.component.file_info {
            -- we only want filename to be used and we can change the fname
            -- function to get the current working directory name
            filename = { fname = function(nr) return vim.fn.getcwd(nr) end, padding = { left = 1 } },
            -- disable all other elements of the file_info component
            file_icon = false,
            file_modified = false,
            file_read_only = false,
            -- use no separator for this part but define a background color
            surround = { separator = "none", color = "file_info_bg", condition = false },
          },
        },
        -- the final component of the NvChad statusline is the navigation section
        -- this is very similar to the previous current working directory section with the icon
        { -- make nav section with icon border
          -- define a custom component with just a file icon
          status.component.builder {
            { provider = require("astronvim.utils").get_icon "ScrollText" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the icon foreground
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            -- as well as the color to the left of the separator
            surround = { separator = "right", color = { main = "nav_icon_bg", left = "file_info_bg" } },
          },
          -- add a navigation component and just display the percentage of progress in the file
          status.component.nav {
            -- add some padding for the percentage provider
            percentage = { padding = { right = 1 } },
            -- disable all other providers
            ruler = false,
            scrollbar = false,
            -- use no separator and define the background color
            surround = { separator = "none", color = "file_info_bg" },
          },
        },
      }

      -- return the final options table
      return opts
    end,
  },
}
