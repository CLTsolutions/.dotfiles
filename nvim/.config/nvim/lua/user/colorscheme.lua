local colorscheme = "tokyonight"
-- local colorscheme = "rose-pine"

-- colorschemes
  -- tokyo night
vim.g.tokyonight_style = "night" -- options: "storm," "night," "day"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
