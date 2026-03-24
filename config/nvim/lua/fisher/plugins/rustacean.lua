-- rustaceanvim: supercharged Rust development (replaces rust-tools.nvim)
-- Auto-configures rust-analyzer with Rust-specific IDE features not exposed
-- by standard lspconfig: hover actions, grouped code actions, macro expansion,
-- runnables/debuggables picker, clippy on save, neotest adapter.
--
-- IMPORTANT: rustaceanvim manages rust-analyzer itself.
-- rust_analyzer is REMOVED from mason-lspconfig ensure_installed.
-- rustfmt formatting still works via conform.nvim (rustfmt built-in).
return {
  "mrcjkb/rustaceanvim",
  version = "^5",   -- semver-pinned for stability
  ft      = { "rust" },
  -- No opts = {} — configure via vim.g.rustaceanvim
  config  = function()
    vim.g.rustaceanvim = {
      -- Extra tools configuration
      tools = {
        -- Use rustaceanvim's hover instead of the default (shows action list)
        hover_actions = {
          replace_builtin_hover = true,
        },
        code_action_group = true,   -- group code actions by category
        float_win_config  = {
          border = "rounded",
        },
      },

      -- rust-analyzer server configuration
      server = {
        on_attach = function(_, bufnr)
          local b = { buffer = bufnr, silent = true }
          local function bmap(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", b, { desc = desc }))
          end

          -- Override standard K with rust-specific hover actions
          bmap("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, "Rust hover actions")

          -- Rust-specific code actions (replaces generic <leader>la in rust files)
          bmap({ "n","v" }, "<leader>la", function() vim.cmd.RustLsp("codeAction") end, "Rust code actions")

          -- Unique rust-analyzer capabilities
          bmap("n", "<leader>re", function() vim.cmd.RustLsp("explainError") end,    "Rust explain error")
          bmap("n", "<leader>rm", function() vim.cmd.RustLsp("expandMacro") end,     "Rust expand macro")
          bmap("n", "<leader>rr", function() vim.cmd.RustLsp("runnables") end,       "Rust runnables")
          bmap("n", "<leader>rd", function() vim.cmd.RustLsp("debuggables") end,     "Rust debuggables")
          bmap("n", "<leader>rt", function() vim.cmd.RustLsp("testables") end,       "Rust testables")
          bmap("n", "<leader>rg", function() vim.cmd.RustLsp("crateGraph") end,      "Rust crate graph")
          bmap("n", "<leader>rp", function() vim.cmd.RustLsp({ "moveItem", "up" }) end,   "Rust move item up")
          bmap("n", "<leader>rP", function() vim.cmd.RustLsp({ "moveItem", "down" }) end, "Rust move item down")
        end,

        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",          -- use clippy (catches more issues than check)
              extraArgs = { "--all-features" },
            },
            procMacro = {
              enable   = true,
              ignored  = { ["async-trait"] = { "async_trait" }, ["napi-derive"] = { "napi" } },
            },
            cargo = {
              buildScripts = { enable = true },
              allFeatures  = false,        -- only build default features (faster)
            },
            inlayHints = {
              bindingModeHints         = { enable = false },
              chainingHints            = { enable = true },
              closingBraceHints        = { enable = true,  minLines = 25 },
              closureReturnTypeHints   = { enable = "with_block" },
              lifetimeElisionHints     = { enable = "skip_trivial", useParameterNames = false },
              maxLength                = { enable = true, limit = 25 },
              parameterHints           = { enable = true },
              reborrowHints            = { enable = "skip_trivial" },
              renderColons             = { enable = true },
              typeHints                = { enable = true, hideClosureInitialization = false, hideNamedConstructor = false },
            },
            diagnostics = { enable = true, experimental = { enable = false } },
            semanticHighlighting      = { strings = { enable = true } },
          },
        },
      },

      -- DAP integration (auto-discovers codelldb from Mason)
      dap = {
        autoload_configurations = true,
      },
    }
  end,
}
