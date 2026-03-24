-- aerial.nvim: code outline / symbol navigator
-- Shows a sidebar with all functions, classes, methods, variables in the current file.
-- Powered by LSP + Treesitter (60+ languages). Auto-updates as you edit.
-- Great for navigating large files without fuzzy search.
return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- Use LSP first, fall back to Treesitter (covers 60+ languages), then markdown/man
    backends = { "lsp", "treesitter", "markdown", "man" },

    layout = {
      max_width      = { 40, 0.2 },   -- max 40 cols or 20% of window
      width          = nil,
      min_width      = 25,
      default_direction = "prefer_right",
      placement      = "window",
    },

    -- Show tree guide lines
    show_guides = true,

    -- Show all symbol kinds (false = don't filter anything out)
    filter_kind = false,

    -- Attach to telescope for symbol search
    telescope = {
      -- <leader>lo opens aerial; <leader>lS opens Telescope aerial picker
    },

    -- Floating navigator window
    nav = {
      border  = "rounded",
      max_height = 0.9,
      min_height = { 10, 0.1 },
      max_width  = 0.45,
      min_width  = { 0.2, 20 },
      win_opts = {
        cursorline = true,
        winblend   = 10,
      },
      keymaps = {
        ["<CR>"]         = "actions.jump",
        ["<2-LeftMouse>"]= "actions.jump",
        ["<C-v>"]        = "actions.jump_vsplit",
        ["<C-s>"]        = "actions.jump_split",
        ["h"]            = "actions.left",
        ["l"]            = "actions.right",
        ["q"]            = "actions.close",
        ["<C-c>"]        = "actions.close",
      },
    },

    -- Highlight the current symbol in the outline as cursor moves
    highlight_on_hover = true,
    highlight_on_jump  = 300,   -- ms to highlight after jumping
  },
  keys = {
    { "<leader>lo",  "<cmd>AerialToggle!<CR>",  desc = "Code outline (aerial)" },
    { "<leader>lO",  "<cmd>AerialNavToggle<CR>", desc = "Aerial nav float" },
    -- Aerial-powered fuzzy symbol search via Telescope
    { "<leader>ls",  "<cmd>Telescope aerial<CR>", desc = "Symbol search (aerial)" },
  },
  config = function(_, opts)
    require("aerial").setup(opts)
    -- Register Telescope extension if telescope is loaded
    pcall(require("telescope").load_extension, "aerial")
  end,
}
