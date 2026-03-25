return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "",
      "                                                        /\\",
      "                                                       /  \\",
      "                                    __________________/    \\___________________",
      "                                   /                                            \\",
      "               ___________________/   (O)                                  ____/",
      "              /                                                        ____/",
      "             /                                                    ____/",
      "            <                    ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~       ___/",
      "             \\                                           ____/|",
      "              \\___________________________________________________/ |",
      "                                                                    |\\",
      "                                                                    | \\",
      "                                                                    |  \\",
      "                                                                    |__/",
      "",
      "              ███████╗██╗  ██╗ █████╗ ██████╗ ██╗  ██╗██╗   ██╗██╗███╗   ███╗",
      "              ██╔════╝██║  ██║██╔══██╗██╔══██╗██║ ██╔╝██║   ██║██║████╗ ████║",
      "              ███████╗███████║███████║██████╔╝█████╔╝ ██║   ██║██║██╔████╔██║",
      "              ╚════██║██╔══██║██╔══██║██╔══██╗██╔═██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║",
      "              ███████║██║  ██║██║  ██║██║  ██║██║  ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "              ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "                              🦈  H A C K E R ' S  V I M  C H O I C E  🦈",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", "<cmd>ene<CR>"),
      dashboard.button("SPC ff", "  Find files", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "󰱼  Live grep", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC fp", "  Projects", "<cmd>Telescope project<CR>"),
      dashboard.button("SPC wr", "  Restore session", "<cmd>SessionRestore<CR>"),
      dashboard.button("SPC ee", "  File explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("m", "󰏔  Mason", "<cmd>Mason<CR>"),
      dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
    }

    local function footer()
      local stats = require("lazy").stats()
      local date = os.date("%A, %B %d, %Y")
      local plugins = string.format("⚡ %d plugins loaded in %.2fms", stats.count, stats.startuptime)
      return { "", plugins, "📅 " .. date, "Press <Space> to open FishVim command tree" }
    end

    dashboard.section.footer.val = footer()
    dashboard.opts.opts.noautocmd = true

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
  end,
}
