vim.opt.smartindent = true
vim.opt.tabstop = 4

vim.api.nvim_set_keymap('n', '<leader><Tab>', ':tabn<CR>', { noremap = true, silent = true })

-- Copilot smartindent
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<Tab>")', { silent = true, expr = true })

-- VSCode keybindings
-- vim.api.nvim_set_keymap("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
--
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

