-- neotest: in-editor test runner with inline pass/fail signs and output panels
-- Adapters: Python (pytest/unittest) + Rust (cargo test)
-- Integrates with DAP to run tests inside the debugger
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
  },
  keys = {
    { "<leader>tn", function() require("neotest").run.run() end,                          desc = "Run nearest test" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,        desc = "Run file tests" },
    { "<leader>tl", function() require("neotest").run.run_last() end,                     desc = "Re-run last test" },
    { "<leader>ts", function() require("neotest").summary.toggle() end,                  desc = "Test summary panel" },
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end,      desc = "Test output" },
    { "<leader>tp", function() require("neotest").output_panel.toggle() end,             desc = "Test output panel" },
    { "<leader>tS", function() require("neotest").run.stop() end,                        desc = "Stop test run" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,     desc = "Debug nearest test" },
    { "]t",         function() require("neotest").jump.next({ status = "failed" }) end,  desc = "Next failed test" },
    { "[t",         function() require("neotest").jump.prev({ status = "failed" }) end,  desc = "Prev failed test" },
  },
  opts = function()
    return {
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          runner = "pytest",
        }),
        require("neotest-rust")({
          args = { "--no-capture" },
        }),
      },
      status   = { virtual_text = true },
      output   = { open_on_run = false },
      quickfix = { open = false },
    }
  end,
}
