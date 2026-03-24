-- inc-rename.nvim: LSP rename with real-time incremental preview
-- As you type the new name, ALL instances update live across the file.
-- With :set inccommand=split, you can preview changes across ALL files before committing.
-- Replaces the plain vim.lsp.buf.rename which gives no visual feedback.
return {
  "smjonas/inc-rename.nvim",
  event = "LspAttach",
  opts = {
    -- Command name (default: IncRename)
    cmd_name    = "IncRename",
    -- Show preview in the command line area
    hl_group    = "Substitute",
    -- Preview name in cmdline (false = show inline only)
    preview_empty_name = false,
    -- When renaming shows a floating input
    show_message = true,
    -- For multi-file preview: ensure inccommand=split is set
    input_buffer_type = nil,  -- nil = use cmdline, "dressing" = popup input
  },
  config = function(_, opts)
    -- Enable split preview for multi-file renames
    vim.opt.inccommand = "split"
    require("inc-rename").setup(opts)
  end,
  keys = {
    {
      "<leader>lr",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      expr = true,
      desc = "Rename symbol (live preview)",
    },
  },
}
