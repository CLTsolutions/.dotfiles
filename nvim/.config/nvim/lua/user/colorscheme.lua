local colorscheme = "tokyonight"
-- local colorscheme = "rose-pine"
--local colorscheme = "material"

-- colorschemes
  -- tokyo night
vim.g.tokyonight_style = "night" -- options: "storm," "night," "day"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
  -- material
-- vim.g.material_style = "palenight" -- options: darker, lighter, oceanic, palenight, deep ocean


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
