-- transparent.nvim: removes background fills so terminal bg shows through
-- Toggle with <leader>ut — great with terminal wallpapers or gradients
return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  config = function()
    require("transparent").setup({
      extra_groups = {
        "NvimTreeNormal", "NvimTreeNormalNC",
        "NormalFloat", "FloatBorder",
        "TelescopeNormal", "TelescopeBorder",
        "WhichKeyFloat",
        "BufferlineTabClose", "BufferlineBufferSelected",
        "BufferlineTabSelected",
        "VertSplit", "WinSeparator",
        "StatusLine", "StatusLineNC",
        "TabLine", "TabLineFill",
        "Pmenu", "PmenuSbar", "PmenuThumb",
        "NoiceCmdline", "NoicePopup",
      },
      exclude_groups = { "CursorLine", "Visual" },
    })
  end,
  keys = {
    { "<leader>ut", "<cmd>TransparentToggle<CR>", desc = "Toggle transparency" },
  },
}
