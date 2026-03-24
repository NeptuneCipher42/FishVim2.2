-- grug-far.nvim: find and replace across files using ripgrep
-- The modern replacement for spectre.nvim — uses ripgrep/ast-grep directly,
-- shows the full CLI command, supports Lua/VimScript replacements, quickfix export.
--
-- Killer features vs search/replace:
--   - Ripgrep-powered: regex, file filters, multiline, fixed strings
--   - Edit result lines directly, save to sync back to source files
--   - History of previous searches
--   - <leader>sr in visual mode prefills with current filetype filter
return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  opts = {
    headerMaxWidth    = 80,
    startInInsertMode = false,
    keymaps = {
      replace        = { n = "<localleader>r" },
      qflist         = { n = "<localleader>q" },
      syncLocations  = { n = "<localleader>s" },
      syncLine       = { n = "<localleader>l" },
      close          = { n = "q" },
      historyOpen    = { n = "<localleader>t" },
      historyAdd     = { n = "<localleader>a" },
      refresh        = { n = "<localleader>f" },
      gotoLocation   = { n = "<enter>" },
      pickHistoryEntry = { n = "<enter>" },
    },
  },
  keys = {
    -- Normal mode: open grug-far in current project
    {
      "<leader>sr",
      function() require("grug-far").open() end,
      desc = "Search & replace (grug-far)",
    },
    -- Visual mode: prefill with current filetype filter
    {
      "<leader>sr",
      function()
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        require("grug-far").open({
          prefills = { filesFilter = ext and ("*." .. ext) or nil },
        })
      end,
      mode = "v",
      desc = "Search & replace in filetype (grug-far)",
    },
    -- Word under cursor
    {
      "<leader>sw",
      function()
        require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Search word under cursor (grug-far)",
    },
  },
}
