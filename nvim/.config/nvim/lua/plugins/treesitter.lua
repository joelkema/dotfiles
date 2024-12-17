-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
    ensure_installed = {
      "lua",
      "vim",
      "vue",
      "typescript",
      "javascript",
      "json",
      "css",
      "html",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
