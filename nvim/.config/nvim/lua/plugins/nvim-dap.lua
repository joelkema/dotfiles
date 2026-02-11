if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mxsdev/nvim-dap-vscode-js",
  },
  config = function()
    -- Enable logging
    require("dap").set_log_level "TRACE"

    -- Setup vscode-js-debug
    require("dap-vscode-js").setup {
      debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter",
      debugger_cmd = { "js-debug-adapter" },
      adapters = { "pwa-node", "pwa-chrome", "node-terminal", "pwa-extensionHost" },
    }

    local dap = require "dap"

    -- Configure Next.js/Node.js debugging
    for _, language in ipairs { "typescript", "javascript", "typescriptreact", "javascriptreact" } do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Next.js",
          -- port = 9229,
          port = 9230, -- so sombrero starts two node processes, hence 9230
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
        },
      }
    end
  end,
}
