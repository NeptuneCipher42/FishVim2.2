-- treewalker.nvim: move through the AST (treesitter syntax tree) structurally
-- C-Up/Down/Left/Right navigates parent/child/sibling nodes
-- SwapDown/SwapUp reorders functions and blocks without cut/paste
return {
  "aaronik/treewalker.nvim",
  event = "BufReadPost",
  opts = { highlight = true, highlight_duration = 250 },
  keys = {
    { "<C-Up>",    "<cmd>Treewalker Up<CR>",      mode = { "n", "v" }, desc = "AST: move up to parent" },
    { "<C-Down>",  "<cmd>Treewalker Down<CR>",    mode = { "n", "v" }, desc = "AST: move down to child" },
    { "<C-Left>",  "<cmd>Treewalker Left<CR>",    mode = { "n", "v" }, desc = "AST: move to prev sibling" },
    { "<C-Right>", "<cmd>Treewalker Right<CR>",   mode = { "n", "v" }, desc = "AST: move to next sibling" },
    { "<leader>cs", "<cmd>Treewalker SwapDown<CR>", desc = "AST: swap node down" },
    { "<leader>cS", "<cmd>Treewalker SwapUp<CR>",   desc = "AST: swap node up" },
  },
}
