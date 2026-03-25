-- rainbow-delimiters.nvim: brackets/parens/braces in rainbow colors per nesting level
-- Makes deeply nested code readable at a glance — each level gets its own color
return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufReadPost",
  config = function()
    local rainbow = require("rainbow-delimiters")
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow.strategy["global"],
        vim  = rainbow.strategy["local"],
      },
      query = {
        [""]     = "rainbow-delimiters",
        lua      = "rainbow-blocks",
        html     = "rainbow-tags",
      },
      priority = {
        [""] = 110,
        lua  = 210,
      },
      -- Cyberpunk neon palette cycling through nesting levels
      highlight = {
        "RainbowDelimiterCyan",
        "RainbowDelimiterYellow",
        "RainbowDelimiterMagenta",
        "RainbowDelimiterBlue",
        "RainbowDelimiterGreen",
        "RainbowDelimiterOrange",
        "RainbowDelimiterRed",
      },
    }

    -- Define the highlight groups to match the cyberpunk palette
    vim.api.nvim_set_hl(0, "RainbowDelimiterCyan",    { fg = "#00FFFF" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterYellow",  { fg = "#FFD700" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterMagenta", { fg = "#FF00FF" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterBlue",    { fg = "#00BFFF" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterGreen",   { fg = "#39FF14" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterOrange",  { fg = "#FF8C00" })
    vim.api.nvim_set_hl(0, "RainbowDelimiterRed",     { fg = "#FF4A4A" })
  end,
}
