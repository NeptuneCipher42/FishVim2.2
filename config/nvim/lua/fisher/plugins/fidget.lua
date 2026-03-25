-- fidget.nvim: LSP progress spinner in the bottom-right corner
-- Shows which language servers are indexing / loading in a non-intrusive way
return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    progress = {
      display = {
        render_limit = 5,
        done_ttl     = 2,
        done_icon    = "✓",
        progress_icon = { pattern = "dots", period = 1 },
      },
    },
    notification = {
      window = {
        winblend = 0,
        border   = "none",
        align    = "bottom",
      },
    },
  },
}
