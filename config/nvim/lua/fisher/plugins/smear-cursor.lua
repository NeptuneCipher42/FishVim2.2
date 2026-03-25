-- smear-cursor.nvim: cursor leaves a neon colored trail as it moves
-- Makes the editor feel alive — the cursor smears across the screen dynamically
return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    -- Neon cyan trail matching the cyberpunk theme
    cursor_color              = "#00FFFF",
    normal_bg                 = "#000000",
    smear_between_buffers     = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space       = true,
    legacy_computing_symbols_support = false,
    stiffness                 = 0.8,   -- 0.1 = very slow/elastic, 1.0 = instant
    trailing_stiffness        = 0.5,
    trailing_exponent         = 0.1,
    hide_target_hack          = true,
    gamma                     = 2.2,   -- color blending gamma
    max_kept_frames           = 32,
    time_interval             = 17,    -- ~60fps
  },
}
