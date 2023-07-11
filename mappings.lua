-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- change buffer movement
    ["]b"] = false,
    ["[b"] = false,
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- change windows resizing
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },

    -- change Buffer Exiting
    ["<leader>c"] = false,
    ["<leader>C"] = false,
    ["<leader>x"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<leader>X"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" },
    -- Change Environments
    ["<leader>E"] = { "<cmd>lua require('swenv.api').pick_venv()<cr>", desc = "Choose Env" },
    -- Markdwown Preview
    ["<leader>P"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdwown Preview" },
    -- Disabling non-used functionalities
    ["<F11>"] = false,
    ["<F17>"] = false,
    ["<F21>"] = false,
    ["<F23>"] = false,
    ["<F29>"] = false,
    -- Tabs configuration
    ["]t"] = false,
    ["[t"] = false,
    ["mt"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
    ["mT"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },
    ["<leader>tc"] = { "<cmd>tabclose<CR>", desc = "Close tab" },
    -- Jukit Mappings
    ["<leader><space>"] = { "<cmd>call jukit#send#section(1)<CR>", desc = "Run Cell" },
    ["<CR>"] = { "<cmd>call jukit#send#line()<CR>", desc = "Run Line" }
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- ["<leader>a"] = { "<cmd>echo 'Hello World'<cr>", desc = "Say Hello World" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    -- Save in Insert Mode
    ["<C-s>"] = { "<Esc>:w<cr>a", desc = "Save the File" },
  }
}
