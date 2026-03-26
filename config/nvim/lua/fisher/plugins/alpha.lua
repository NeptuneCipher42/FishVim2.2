return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Shark two-tone: blue back, white belly, bright white FISHVIM title
    vim.api.nvim_set_hl(0, "AlphaSharkBack",  { fg = "#1A7FE8" })
    vim.api.nvim_set_hl(0, "AlphaSharkBelly", { fg = "#C8E8FF" })
    vim.api.nvim_set_hl(0, "AlphaFishVim",    { fg = "#FFFFFF", bold = true })
    vim.api.nvim_set_hl(0, "AlphaSubtitle",   { fg = "#4DAAFF" })

    dashboard.section.header.val = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣠⣤⣤⠶⠶⠶⠶⠾⠛⠛⠛⠛⠛⠛⠛⢿",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣶⣿⣛⠛⠛⠛⠓⠢⢄⡀⠀⠤⠟⠂⠀⠀⠀⠀⠀⠀⢀⡿",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⠾⠛⠉⠑⠤⣙⢮⡉⠓⣦⣄⡀⠀⣹⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⡶⠞⠋⠉⠀⠀⠀⠀⠀⠀⠒⠛⠛⠛⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⢰⡟⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠾⠛⠉⣡⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⢺⢿⢉⡽⡟⢓⣶⠦⢤⣀⡀⠈⠳⣿⠁",
      "⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠟⠁⠀⠀⣀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠚⠁⠀⢛⠛⠛⠻⢷⡧⣾⡴⣛⣏⣹⡇⣀⣿ ███████╗██╗███████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗",
      "⠀⠀⠀⠀⠀⠀⣠⠞⠋⠀⣀⠤⠒⢉⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠔⠋⠀⣀⠴⠚⠛⠛⠯⡑⠂⠀⠀⡏⢹⣿⡾⠟⠋⠁ ██╔════╝██║██╔════╝██║  ██║██║   ██║██║████╗ ████║",
      "⠀⠀⠀⠀⣠⠞⠁⠀⠐⠊⠀⠀⢠⡿⠁⠀⢰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⣤⡿⠋⠀⠀⠀⠀⠀⠀⡹⠀⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀█████╗  ██║███████╗███████║██║   ██║██║██╔████╔██║",
      "⠀⠀⣠⡞⠁⠀⠀⠀⠀⠀⠀⢠⡿⠁⢀⢸⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⡞⠋⠉⠉⠓⠒⠢⢤⣴⣥⣆⣠⡾⠋⠀⠀⠀⣦⠀⠀⠀██╔══╝  ██║╚════██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "⠀⣼⠋⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀⠀⢸⠀⡆⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⢽⣦⠀⠀⠀⠀⠀⠀⣟⡿⣽⡏⠀⠀⠀⠀⠀⡿⣧⠀⠀██║     ██║███████║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "⢸⣇⣤⣤⣤⣤⣄⡀⠀⢀⡾⠁⠀⠀⢘⡆⠱⡈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⢻⡚⡆⣀⠀⠀⠀⢸⡽⣿⠃⠀⠀⠀⠀⠀⡇⢹⡄ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "⠀⠀⠀⠀⠀⠀⠈⠙⢷⣾⠃⠀⠀⠀⠈⠾⣦⣙⠪⢷⠄⠀⠀⠀⠀⠀⠀⠀⠈⠻⣭⣟⣹⢦⣀⣀⣟⣹⡟⠀⠀⠀⠀⠀⠀⡇⠈⣷",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⠀⠀⣤⠶⠖⠊⠉⠀⠉⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠦⣼⣞⣹⣯⠟⠁⠀⠀⠀⠀⠀⠀⡇⠀⢹",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⡾⠁⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣲⡾⠟⠛⠳⣤⡀⠀⠀⠀⠀⠀⠀⡇⠀⣸",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⡟⠁⠀⠀⠀⠀⠀⠀⣼⠇⠀⠀⠀⠀⠀⠀⠀⠙⣻⡿⣿⣯⣁⠀⢰⡀⠀⠀⠙⠳⣄⡀⠀⢠⡟⠋⡔⣿",
      "⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⢀⡼⠁⠀⠀⠀⠀⠀⠀⠀⢀⠔⠋⢰⠛⢄⠉⠛⠾⣧⡀⠀⠀⠀⠈⠻⣤⣸⡡⠎⢀⡏",
      "⠀⠀⠀⠀⠀⠀⢰⡟⠀⠀⠀⠀⠀⠀⢠⡾⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠙⠲⢤⣈⣉⠳⢦⣄⡀⠀⠈⠻⣄⠀⣼⠃",
      "⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⠀⠀⠀⣠⠟⠀⠙⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠛⠶⣤⡙⣾⠃",
      "⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⣀⣤⠾⠻⣦⡀⠀⠀⠀⠈⠑⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⠟⠁",
      "⠀⠀⠀⠀⠀⣏⣠⡴⠞⠋⠉⠀⠀⠀⠈⠛⢶⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⣉⣽⠟⠋",
      "⠀⠀⠀⠀⠀⢋⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠒⠶⠶⢤⣤⣤⣤⣤⣤⣤⣤⡤⠴⠶⠖⠚⠋⠉",
      "                                                🐟 H A C K E R ' S  V I M  C H O I C E 🐟",
    }

    -- Per-line two-tone highlight: blue back (top) → white belly (bottom)
    -- Mixed lines split at exact byte offset where FISHVIM ASCII banner begins
    dashboard.section.header.opts = {
      position = "center",
      hl = {
        { { "AlphaSharkBack",  0, 500 } },                              -- 1: upper back
        { { "AlphaSharkBack",  0, 500 } },                              -- 2
        { { "AlphaSharkBack",  0, 500 } },                              -- 3
        { { "AlphaSharkBack",  0, 500 } },                              -- 4
        { { "AlphaSharkBack",  0, 500 } },                              -- 5
        { { "AlphaSharkBack",  0, 144 }, { "AlphaFishVim", 145, 500 } }, -- 6: mixed
        { { "AlphaSharkBack",  0, 144 }, { "AlphaFishVim", 145, 500 } }, -- 7: mixed
        { { "AlphaSharkBack",  0, 166 }, { "AlphaFishVim", 167, 500 } }, -- 8: mixed
        { { "AlphaSharkBelly", 0, 166 }, { "AlphaFishVim", 167, 500 } }, -- 9: mixed
        { { "AlphaSharkBelly", 0, 160 }, { "AlphaFishVim", 161, 500 } }, -- 10: mixed
        { { "AlphaSharkBelly", 0, 144 }, { "AlphaFishVim", 145, 500 } }, -- 11: mixed (╚═╝ row)
        { { "AlphaSharkBelly", 0, 500 } },                              -- 12: lower belly
        { { "AlphaSharkBelly", 0, 500 } },                              -- 13
        { { "AlphaSharkBelly", 0, 500 } },                              -- 14
        { { "AlphaSharkBelly", 0, 500 } },                              -- 15
        { { "AlphaSharkBelly", 0, 500 } },                              -- 16
        { { "AlphaSharkBelly", 0, 500 } },                              -- 17
        { { "AlphaSharkBelly", 0, 500 } },                              -- 18
        { { "AlphaSharkBelly", 0, 500 } },                              -- 19
        { { "AlphaSharkBelly", 0, 500 } },                              -- 20
        { { "AlphaSharkBelly", 0, 500 } },                              -- 21: tail
        { { "AlphaSubtitle",   0, 500 } },                              -- 22: subtitle
      },
    }

    dashboard.section.buttons.val = {
      dashboard.button("e",       "  New file",        "<cmd>ene<CR>"),
      dashboard.button("SPC ff",  "  Find files",      "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs",  "󰱼  Live grep",       "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC fp",  "  Projects",        "<cmd>Telescope project<CR>"),
      dashboard.button("SPC wr",  "  Restore session", "<cmd>SessionRestore<CR>"),
      dashboard.button("SPC ee",  "  File explorer",   "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("m",       "󰏔  Mason",           "<cmd>Mason<CR>"),
      dashboard.button("l",       "󰒲  Lazy",            "<cmd>Lazy<CR>"),
      dashboard.button("q",       "󰅚  Quit",            "<cmd>qa<CR>"),
    }

    local function footer()
      local stats = require("lazy").stats()
      local date = os.date("%A, %B %d, %Y")
      local plugins = string.format("⚡ %d plugins loaded in %.2fms", stats.count, stats.startuptime)
      return { "", plugins, "📅 " .. date, "Press <Space> to open FishVim command tree" }
    end

    dashboard.section.footer.val = footer()
    dashboard.opts.opts.noautocmd = true

    dashboard.opts.layout = {
      { type = "padding", val = 1 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        pcall(function()
          dashboard.section.footer.val = footer()
          alpha.redraw()
        end)
      end,
    })

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

    local default_cursor = vim.opt.guicursor:get()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt.guicursor = "a:noCursor"
      end,
    })
    vim.api.nvim_create_autocmd("BufUnload", {
      pattern = "<buffer>",
      callback = function()
        vim.opt.guicursor = default_cursor
      end,
    })
  end,
}
