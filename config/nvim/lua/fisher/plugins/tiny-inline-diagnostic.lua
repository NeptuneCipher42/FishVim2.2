-- tiny-inline-diagnostic.nvim: styled inline diagnostics that don't shift code
-- Replaces the noisy virtual_text / virtual_lines behavior from Neovim 0.11
-- Renders multi-line messages as compact inline arrows without pushing lines down
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  opts = {
    preset = "powerline",   -- powerline / modern / minimal / ghost / simple / nonerdfont
    options = {
      show_source              = true,
      multiple_diag_under_cursor = true,
      multilines               = { enabled = true, always_show = false },
      show_all_diags_on_cursorline = false,
      enable_on_insert         = false,
    },
  },
  config = function(_, opts)
    require("tiny-inline-diagnostic").setup(opts)
    -- hand diagnostic rendering to this plugin; disable native virtual_text
    vim.diagnostic.config({ virtual_text = false })
  end,
}
