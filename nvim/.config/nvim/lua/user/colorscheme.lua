local colorscheme = "catppuccin-mocha" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- local colorscheme = "dracula"
-- local colorscheme = "material"
-- local colorscheme = "rose-pine"
-- local colorscheme = "tokyonight"

-- ============
-- colorschemes
-- ============
  -- tokyonight
vim.g.tokyonight_style = "night" -- options: "storm," "night," "day"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
      -- change theme colors
-- vim.g.tokyonight_colors = { ColorColumn = { bg = "#2239a8" } }

  -- material
-- vim.g.material_style = "palenight" -- options: darker, lighter, oceanic, palenight, deep ocean

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  vim.cmd "colorscheme rose-pine"
  return
end
