return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { fg = "#FF00FF" }, -- Bright magenta keywords
          functions = { fg = "#00BFFF" }, -- Electric blue functions
          variables = { fg = "#39FF14" }, -- Neon green variables
          strings = { fg = "#FFD700" }, -- Bright yellow strings
          constants = { fg = "#FFD700" }, -- Bright yellow constants
        },
        on_colors = function(colors)
          -- Background
          colors.bg = "#000000" -- Jet black background
          colors.bg_dark = "#000000"
          colors.bg_float = "#000000"
          colors.bg_highlight = "#1A1A1A"
          colors.bg_sidebar = "#000000"
          colors.bg_statusline = "#000000"
          colors.bg_visual = "#00FFFF" -- Cyan selection
          
          -- Borders & UI Accents
          colors.border = "#00BFFF" -- Electric blue borders
          colors.fg = "#39FF14" -- Neon green text
          colors.fg_dark = "#008000" -- Dark green for secondary text
          colors.fg_gutter = "#228B22" -- Deep green line numbers
          colors.fg_sidebar = "#39FF14"
          colors.bg_search = "#FFD700" -- Bright yellow search highlight

          -- Extra Cyberpunk Accents
          colors.blue = "#00BFFF"
          colors.blue1 = "#00FFFF"
          colors.blue2 = "#00FFFF"
          colors.blue5 = "#5F9EA0"
        end,
      })

      -- Apply colorscheme
      vim.cmd([[colorscheme tokyonight]])

      -- ── Base syntax ─────────────────────────────────────────────────────────
      vim.cmd([[
        highlight Normal          guibg=#000000 guifg=#39FF14
        highlight Comment         guifg=#008000 gui=italic
        highlight CursorLine      guibg=#0D1F0D
        highlight LineNr          guifg=#228B22
        highlight CursorLineNr    guifg=#39FF14 gui=bold
        highlight Visual          guibg=#003333 guifg=#00FFFF
        highlight Function        guifg=#00BFFF gui=bold
        highlight Keyword         guifg=#FF00FF gui=bold
        highlight Statement       guifg=#00FFFF
        highlight Type            guifg=#FFD700 gui=bold
        highlight String          guifg=#FFD700
        highlight Constant        guifg=#FFD700
        highlight Operator        guifg=#FF00FF
        highlight Number          guifg=#FF8C00

        " ── Panels with distinct background tints (webpage sections) ──────────
        " Sidebar / file tree  → deep navy
        highlight NvimTreeNormal        guibg=#050D1A guifg=#39FF14
        highlight NvimTreeNormalNC      guibg=#050D1A guifg=#228B22
        highlight NvimTreeWinSeparator  guifg=#00BFFF guibg=#050D1A

        " Floating windows     → dark teal
        highlight NormalFloat     guibg=#001A1A guifg=#39FF14
        highlight FloatBorder     guifg=#00FFFF guibg=#001A1A
        highlight FloatTitle      guifg=#00FFFF guibg=#001A1A gui=bold

        " Popup menu           → deep purple tint
        highlight Pmenu           guibg=#0D001A guifg=#39FF14
        highlight PmenuSel        guibg=#1A0033 guifg=#00FFFF gui=bold
        highlight PmenuSbar       guibg=#0D001A
        highlight PmenuThumb      guibg=#FF00FF
        highlight PmenuBorder     guifg=#FF00FF guibg=#0D001A

        " Telescope            → dark indigo
        highlight TelescopeNormal       guibg=#050010 guifg=#39FF14
        highlight TelescopeBorder       guifg=#7700FF guibg=#050010
        highlight TelescopePromptBorder guifg=#00FFFF guibg=#050010
        highlight TelescopeResultsBorder guifg=#7700FF guibg=#050010
        highlight TelescopePreviewBorder guifg=#228B22 guibg=#050010
        highlight TelescopeSelection    guibg=#0D001A guifg=#00FFFF

        " Which-key            → dark magenta panel
        highlight WhichKeyFloat   guibg=#0D0014
        highlight WhichKey        guifg=#00FFFF gui=bold
        highlight WhichKeyDesc    guifg=#39FF14
        highlight WhichKeyGroup   guifg=#FF00FF gui=bold

        " Statusline
        highlight StatusLine      guibg=#000000 guifg=#39FF14
        highlight StatusLineNC    guibg=#050505 guifg=#228B22
        highlight WinSeparator    guifg=#00BFFF

        " Borders
        highlight FloatBorder     guifg=#00BFFF guibg=#001A1A
        highlight NetrwHeader     guifg=#00BFFF guibg=NONE

        " Search / incline
        highlight Search          guibg=#FFD700 guifg=#000000 gui=bold
        highlight IncSearch       guibg=#FF00FF guifg=#000000 gui=bold
        highlight CurSearch       guibg=#00FFFF guifg=#000000 gui=bold

        " Diff
        highlight DiffAdd         guibg=#002200
        highlight DiffChange      guibg=#001A33
        highlight DiffDelete      guibg=#330000
        highlight DiffText        guibg=#003355 gui=bold
      ]])

      -- Function: Electric Blue
      -- Keywords: Bright Magenta
      -- Strings/Constants: Bright Yellow
      -- Borders & UI highlights: Electric Blue
      -- Search & Selection: Cyan
    end,
  },
}
