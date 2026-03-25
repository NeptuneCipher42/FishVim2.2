-- nvim-highlight-colors: inline color swatches for hex/rgb/hsl/CSS values
-- Shows a colored square next to any color literal — like a webpage inspector
return {
  "brenoprata10/nvim-highlight-colors",
  event = "BufReadPost",
  opts = {
    render              = "background",  -- "background" | "foreground" | "virtual"
    virtual_symbol      = "■",
    virtual_symbol_prefix  = " ",
    virtual_symbol_suffix  = " ",
    enable_named_colors = true,   -- support CSS color names (red, blue, etc.)
    enable_tailwind     = true,   -- support Tailwind CSS class colors
    custom_colors       = {
      -- match the cyberpunk palette so our own hex codes light up
      { label = "#00FFFF", color = "#00FFFF" },
      { label = "#39FF14", color = "#39FF14" },
      { label = "#FF00FF", color = "#FF00FF" },
      { label = "#FFD700", color = "#FFD700" },
      { label = "#00BFFF", color = "#00BFFF" },
    },
  },
}
