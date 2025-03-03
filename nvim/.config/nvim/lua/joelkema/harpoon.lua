local harpoon = require('harpoon')

harpoon:setup({})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to harpoon list"})
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)

-- basic telescope configuration
-- this is unused for now
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local finder = function()
--         local paths = {}
--         for _, item in ipairs(harpoon_files.items) do
--             table.insert(paths, item.value)
--         end
--
--         return require("telescope.finders").new_table({
--             results = paths,
--         })
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = finder(),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--         attach_mappings = function(prompt_bufnr, map)
--             map("i", "<C-d>", function()
--                 local state = require("telescope.actions.state")
--                 local selected_entry = state.get_selected_entry()
--                 local current_picker = state.get_current_picker(prompt_bufnr)
--
--                 table.remove(harpoon_files.items, selected_entry.index)
--                 current_picker:refresh(finder())
--             end)
--             return true
--         end,
--     }):find()
-- end
--
-- vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon window" })

