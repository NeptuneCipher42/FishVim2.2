-- git-conflict.nvim: visual merge conflict resolution
-- Highlights ours/theirs/both sections with distinct colors.
-- Trending in 2025 — essential for any git workflow involving rebases/merges.
--
-- Keymaps (active only in conflicted buffers):
--   co  = accept Current (ours)
--   ct  = accept incoming (Theirs)
--   cb  = keep Both
--   c0  = delete Both (none)
--   ]x  = next conflict
--   [x  = prev conflict
return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "BufReadPre",
  opts = {
    default_mappings   = true,   -- co, ct, cb, c0, ]x, [x
    default_commands   = true,   -- :GitConflict* commands
    disable_diagnostics = false, -- show errors inside conflict blocks
    list_opener        = "copen",
    highlights = {
      incoming = "DiffAdd",
      current  = "DiffText",
    },
  },
  keys = {
    { "<leader>gC", "<cmd>GitConflictListQf<CR>", desc = "Git conflicts list" },
    { "]x",         desc = "Next conflict" },
    { "[x",         desc = "Prev conflict" },
  },
}
