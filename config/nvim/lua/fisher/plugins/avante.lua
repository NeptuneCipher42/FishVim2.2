-- avante.nvim: Cursor AI IDE experience inside Neovim (17.6k+ stars)
-- Shows an AI side panel with code analysis, suggestions, and one-click apply.
-- Complements codecompanion (chat/agent) — avante excels at inline diff workflow.
--
-- REQUIRES: Rust toolchain for build step (`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`)
-- Set ANTHROPIC_API_KEY in your shell profile for Claude (default provider).
--
-- Key bindings (avante prefix: <leader>av):
--   <leader>av  = Toggle avante sidebar
--   <leader>ae  = Edit/ask about selected code (visual mode)
--   <leader>ar  = Refresh avante response
--   <leader>af  = Focus avante window
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  -- NOTE: set version = false to always use latest (avante updates frequently)
  version = false,
  -- Rust binary compilation — requires Rust toolchain
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.icons",
    -- Optional: paste images into avante chat
    -- { "HakonHarnes/img-clip.nvim", event = "VeryLazy", opts = { default = { embed_image_as_base64 = false, prompt_for_file_name = false, drag_and_drop = { insert_mode = true } } } },
    -- Optional: markdown rendering in avante buffers
    { "MeanderingProgrammer/render-markdown.nvim", opts = { file_types = { "markdown", "Avante" } }, ft = { "markdown", "Avante" } },
  },
  opts = {
    -- Default provider: claude (set ANTHROPIC_API_KEY)
    -- To use GPT: change to "openai" and set OPENAI_API_KEY
    -- To use local: change to "ollama"
    provider = "claude",

    -- Claude configuration
    providers = {
      claude = {
        api_key_name       = "ANTHROPIC_API_KEY",
        model              = "claude-sonnet-4-6-20251101",
        extra_request_body = {
          max_tokens  = 8192,
          temperature = 0,
        },
      },
    },

    -- Alternative: uncomment to use GPT-4
    -- openai = {
    --   api_key_name = "OPENAI_API_KEY",
    --   model = "gpt-4o",
    --   max_tokens = 8192,
    -- },

    -- Sidebar behavior
    behaviour = {
      auto_suggestions             = false,  -- disable continuous inline suggestions (use copilot for that)
      auto_set_highlight_group     = true,
      auto_set_keymaps             = true,
      auto_apply_diff_after_generation = false,  -- require manual apply
      support_paste_from_clipboard = false,
    },

    -- Side panel width
    windows = {
      position        = "right",
      wrap            = true,
      width           = 40,
      sidebar_header  = {
        align = "center",
        rounded = true,
      },
    },

    -- Diff display when applying suggestions
    diff = {
      autojump     = true,
      list_opener  = "copen",
    },

    -- Custom keymaps: avoid conflicting with codecompanion's <leader>aa/<leader>ae
    mappings = {
      diff = {
        ours    = "co",  -- matches git-conflict.nvim convention
        theirs  = "ct",
        both    = "cb",
        none    = "c0",
        next    = "]a",
        prev    = "[a",
      },
      suggestion = {
        accept = "<M-l>",
        next   = "<M-]>",
        prev   = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
    },
  },
  keys = {
    -- Use <leader>av prefix to avoid conflicts with codecompanion <leader>ai/<leader>aa
    { "<leader>av",  "<cmd>AvanteToggle<CR>",   mode = { "n", "v" }, desc = "Avante toggle sidebar" },
    { "<leader>aV",  "<cmd>AvanteRefresh<CR>",  desc = "Avante refresh" },
    { "<leader>af",  "<cmd>AvanteFocus<CR>",    desc = "Avante focus" },
    -- In visual mode: ask avante about the selection
    { "<leader>ae",  "<cmd>AvanteAsk<CR>",      mode = "v",          desc = "Avante ask about selection" },
  },
}
