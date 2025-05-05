return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    transparent_background = true, -- disables setting the background color.
    config = function() vim.cmd.colorscheme "catppuccin-mocha" end,
  },
}
