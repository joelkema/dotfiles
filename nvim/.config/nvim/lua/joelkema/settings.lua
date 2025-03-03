local builtin = require('telescope.builtin')

vim.opt.smartindent = true
vim.opt.tabstop = 4

-- vim.api.nvim_set_keymap('n', '<leader><Tab>', ':tabn<CR>', { noremap = true, silent = true })

-- Copilot toggle chat window 
-- vim.keymap.set('n', '<leader>cc', function()
    -- local chat = require("CopilotChat")
    -- chat.toggle({ window });
-- end, { desc = "Toggle CopilotChat window" })

-- Copilot smartindent
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<Tab>")', { silent = true, expr = true })

-- VSCode keybindings
-- vim.api.nvim_set_keymap("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
--
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Search for string" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')


