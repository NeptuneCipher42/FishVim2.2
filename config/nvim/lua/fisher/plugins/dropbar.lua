-- dropbar.nvim: IDE-style breadcrumb winbar with clickable dropdowns
-- Shows current position: file → class → function, powered by LSP + treesitter
-- Click any segment to jump there; <leader>lp opens the picker
return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  opts = {
    general = {
      update_events = {
        win    = { "CursorMoved", "CursorMovedI", "WinScrolled", "WinResized" },
        buf    = { "BufModifiedSet", "FileChangedShellPost", "TextChanged", "TextChangedI" },
        global = { "DirChanged", "VimResized" },
      },
    },
    icons = {
      kinds = { use_devicons = true },
      ui    = { bar = { separator = "  " } },
    },
    bar = {
      hover  = true,
      pick   = { pivots = "abcdefghijklmnopqrstuvwxyz" },
    },
  },
  keys = {
    { "<leader>lp", function() require("dropbar.api").pick() end, desc = "Breadcrumb pick" },
  },
}
