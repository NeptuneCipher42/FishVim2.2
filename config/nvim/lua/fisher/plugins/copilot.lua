-- copilot.lua: GitHub Copilot inline ghost text completion
-- Pure Lua replacement for copilot.vim — faster, more configurable.
-- Provides continuous ghost text suggestions AS YOU TYPE (different from blink.cmp).
-- blink.cmp = explicit completion menu; copilot = always-on ghost text overlay.
--
-- REQUIRES: Active GitHub Copilot subscription
-- First run: :Copilot auth  (authenticate with GitHub)
--
-- Auto-trigger is OFF by default to preserve battery/performance.
-- Enable with: require("copilot.suggestion").toggle_auto_trigger()
-- Or set auto_trigger = true below.
--
-- Keymaps (insert mode):
--   <M-l>  = accept full suggestion
--   <M-w>  = accept next word
--   <M-]>  = next suggestion
--   <M-[>  = prev suggestion
--   <C-]>  = dismiss
return {
  "zbirenbaum/copilot.lua",
  cmd   = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      -- Copilot panel: shows multiple suggestions in a split (rarely used with ghost text)
      panel = {
        enabled   = false,  -- use ghost text instead
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept    = "<CR>",
          refresh   = "gr",
          open      = "<M-CR>",
        },
        layout = {
          position = "bottom",
          ratio    = 0.4,
        },
      },

      suggestion = {
        enabled      = true,
        auto_trigger = false,  -- set true if you want always-on suggestions
        debounce     = 75,
        keymap = {
          accept      = "<M-l>",  -- Alt+L: accept full line
          accept_word = "<M-w>",  -- Alt+W: accept next word
          accept_line = false,
          next        = "<M-]>",
          prev        = "<M-[>",
          dismiss     = "<C-]>",
        },
      },

      filetypes = {
        -- Enable for all file types by default
        ["*"]       = true,
        -- Disable for certain types where AI completion is noisy or wrong
        markdown    = false,   -- render-markdown.nvim handles markdown
        help        = false,
        gitcommit   = false,
        gitrebase   = false,
        hgcommit    = false,
        svn         = false,
        cvs         = false,
        ["."]       = false,   -- dotfiles
      },

      -- copilot_node_command defaults to "node" — ensure node is on PATH
      copilot_node_command = "node",

      -- Workspace-level context (experimental)
      workspace_folders = {},
    })

    -- Hide Copilot ghost text when blink.cmp completion menu opens
    -- (prevents visual interference between ghost text and popup)
    vim.api.nvim_create_autocmd("User", {
      pattern  = "BlinkCmpMenuOpen",
      callback = function() vim.b.copilot_suggestion_hidden = true end,
    })
    vim.api.nvim_create_autocmd("User", {
      pattern  = "BlinkCmpMenuClose",
      callback = function() vim.b.copilot_suggestion_hidden = false end,
    })
  end,
  keys = {
    {
      "<leader>uC",
      function()
        require("copilot.suggestion").toggle_auto_trigger()
        local state = require("copilot.suggestion").is_visible() and "ON" or "OFF"
        vim.notify("Copilot auto-trigger: " .. state, vim.log.levels.INFO)
      end,
      desc = "Toggle Copilot auto-trigger",
    },
    { "<leader>cp", "<cmd>Copilot panel<CR>",  desc = "Copilot panel" },
    { "<leader>cP", "<cmd>Copilot disable<CR>", desc = "Copilot disable" },
  },
}
