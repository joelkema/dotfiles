if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local function getVueTsPluginPathFromMason()
	local mason_registry = require("mason-registry")
	local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
		.. "/node_modules/@vue/language-server"
	return vue_language_server_path
end

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    plugins = {       
      {
        name = "@vue/typescript-plugin",
		location = getVueTsPluginPathFromMason(),
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

lspconfig.volar.setup {}

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "eslint" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- return {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--         { 'WhoIsSethDaniel/mason-tool-installer.nvim' }
--     },
--     config = function()
--         local lspconfig = require("lspconfig")
--
--         -- Vue
--         local servers = {
--             ts_ls = {
-- 					init_options = {
-- 						plugins = {
-- 							{
-- 								name = "@vue/typescript-plugin",
-- 								location = getVueTsPluginPathFromMason(),
-- 								languages = { "vue" },
-- 							},
-- 						},
-- 					},
-- 					filetypes = {
-- 						"typescript",
-- 						"javascript",
-- 						"javascriptreact",
-- 						"typescriptreact",
-- 						"vue",
-- 					},
-- 				},
-- 				volar = {},        
-- 		}
--
-- 		local ensure_installed = vim.tbl_keys(servers or {})
-- 		vim.list_extend(ensure_installed, {
-- 			"stylua", -- Used to format Lua code
-- 			"prettierd",
-- 		})
--
-- 		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
-- 	    require("mason-lspconfig").setup({
-- 				handlers = {
-- 					function(server_name)
-- 						local server = servers[server_name] or {}
-- 						lspconfig[server_name].setup(server)
-- 					end,
-- 				},
-- 			})
--     end
-- }
