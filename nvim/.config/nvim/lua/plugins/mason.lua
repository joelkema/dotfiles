-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        -- "lua-language-server",
        --
        -- -- Language Servers
        -- "typescript-language-server", -- TypeScript/JavaScript/React
        -- "eslint-lsp", -- ESLint
        -- "tailwindcss-language-server", -- Tailwind (optional)
        -- "emmet-ls", -- HTML/JSX snippets
        -- "json-lsp", -- JSON files
        --
        -- -- Formatters
        -- "prettierd", -- Fast Prettier
        --
        -- -- Debugger
        -- "js-debug-adapter", -- JavaScript/React debugging
      },
    },
  },
}
