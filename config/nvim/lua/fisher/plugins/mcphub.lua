-- mcphub.nvim: Model Context Protocol hub — connects MCP servers to AI plugins
-- Gives codecompanion + avante real tools: filesystem, GitHub, web search, DBs
-- Makes AI coding genuinely agentic (can read files, run searches, call APIs)
-- Requires: npm install -g mcp-hub@latest  (run once after install)
return {
  "ravitemer/mcphub.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd   = { "MCPHub" },
  build = "npm install -g mcp-hub@latest",
  opts  = {
    auto_approve = false,   -- confirm before AI executes MCP tool calls
    extensions = {
      codecompanion = { enabled = true },
      avante        = { enabled = true },
    },
  },
  keys = {
    { "<leader>am", "<cmd>MCPHub<CR>", desc = "MCP Hub (AI tools)" },
  },
}
