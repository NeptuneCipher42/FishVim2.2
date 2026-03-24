-- kulala.nvim: HTTP/REST/GraphQL client inside Neovim
-- Successor to archived rest.nvim. Write .http files, send requests, inspect responses.
-- Supports: HTTP, GraphQL, WebSocket, gRPC, Postman/OpenAPI/Bruno import/export,
--           pre/post-request Lua scripts, environment variables, OAuth2, AWS auth.
--
-- Usage: Create a .http file with standard REST format:
--   GET https://api.example.com/users
--   Authorization: Bearer {{token}}
--
-- Then use <leader>Rs to send the request at cursor.
return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "graphql" },
  opts = {
    -- Show response body by default (switch to "headers" or "headers_body" as needed)
    default_view    = "body",
    default_env     = "dev",
    debug           = false,
    request_timeout = 30000,  -- ms before timeout

    -- UI options
    ui = {
      show_headers         = true,
      winbar               = true,
      default_winbar_panes = { "body", "headers", "headers_body", "stats", "script_output" },
    },

    -- Curl flags passed to all requests
    additional_curl_options = {},

    -- Environment files pattern
    environment_scope = "b",  -- b = buffer, g = global

    venv_autoload = true,     -- auto-activate Python virtualenv if found
  },
  keys = {
    { "<leader>Rs", function() require("kulala").run() end,                desc = "HTTP: send request",     ft = "http" },
    { "<leader>Ra", function() require("kulala").run_all() end,            desc = "HTTP: send all",         ft = "http" },
    { "<leader>Rb", function() require("kulala").scratchpad() end,         desc = "HTTP: open scratchpad" },
    { "<leader>Rc", function() require("kulala").copy() end,               desc = "HTTP: copy as cURL",     ft = "http" },
    { "<leader>Ri", function() require("kulala").from_curl() end,          desc = "HTTP: import from cURL" },
    { "<leader>Re", function() require("kulala").set_selected_env() end,   desc = "HTTP: select environment", ft = "http" },
    { "<leader>Rp", function() require("kulala").jump_prev() end,          desc = "HTTP: prev request",     ft = "http" },
    { "<leader>Rn", function() require("kulala").jump_next() end,          desc = "HTTP: next request",     ft = "http" },
    { "<leader>Rv", function() require("kulala").toggle_view() end,        desc = "HTTP: toggle view",      ft = "http" },
  },
}
