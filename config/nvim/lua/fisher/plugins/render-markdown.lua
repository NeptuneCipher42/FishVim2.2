-- render-markdown.nvim: render markdown beautifully inside Neovim
-- 4.3k+ stars. Renders headings, code blocks, tables, checkboxes, callouts
-- in-place — no external window, only visible lines rendered (fast on large files).
-- Switches between formatted and raw view automatically when cursor enters line.
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  -- Only load for markdown and AI chat buffers
  ft = { "markdown", "codecompanion", "Avante" },
  opts = {
    enabled = true,

    heading = {
      enabled = true,
      sign    = true,
      -- Nerd Font heading icons per level
      icons   = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      -- Color headings differently per level
      backgrounds = {
        "RenderMarkdownH1Bg", "RenderMarkdownH2Bg", "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg", "RenderMarkdownH5Bg", "RenderMarkdownH6Bg",
      },
    },

    code = {
      enabled  = true,
      sign     = false,
      style    = "full",   -- show language label + border
      border   = "thin",
      language_pad = 1,
    },

    -- Render bullet list icons
    bullet = {
      enabled = true,
      icons   = { "●", "○", "◆", "◇" },
    },

    -- Checkbox rendering (great for TODO lists)
    checkbox = {
      enabled  = true,
      unchecked = { icon = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
      checked   = { icon = "󰱒 ", highlight = "RenderMarkdownChecked" },
      custom    = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
      },
    },

    -- Table borders
    pipe_table = {
      enabled = true,
      style   = "full",
    },

    -- Block quotes with custom icon
    quote = {
      enabled   = true,
      icon      = "▋",
      highlight = "RenderMarkdownQuote",
    },

    -- Callouts (> [!NOTE], > [!WARNING], etc.)
    callout = {
      note    = { raw = "[!NOTE]",    rendered = "󰋽 Note",    highlight = "RenderMarkdownInfo" },
      tip     = { raw = "[!TIP]",     rendered = "󰌶 Tip",     highlight = "RenderMarkdownSuccess" },
      warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
      caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
      important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
    },

    -- Don't render virtual text on the cursor line (lets you see raw markdown)
    anti_conceal = { enabled = true },

    -- Toggle with keymap
    -- Default: <leader>um toggled in the keys below
  },
  keys = {
    {
      "<leader>um",
      function() require("render-markdown").toggle() end,
      ft = "markdown",
      desc = "Toggle markdown rendering",
    },
  },
}
