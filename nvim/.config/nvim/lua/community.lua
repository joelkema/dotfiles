-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
{ import = "astrocommunity.recipes.disable-tabline" },
  -- import/override with your plugins folder
}
