local fn = vim.fn
-- automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- autocommand to reload neovim whenever plugins.lua file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so packer doesn't error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Packer failed")
  return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- install plugins here
return packer.startup(function(use)
  -- my plugins
  use "wbthomason/packer.nvim" -- have packer manage itself
  use "nvim-lua/popup.nvim" -- an implementation of the popup API from vim in neovim
  use "nvim-lua/plenary.nvim" -- useful lua functions used by many plugins
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use "windwp/nvim-autopairs" -- integrates with both cmp and treesitter
  use "p00f/nvim-ts-rainbow" -- like bracket pair colorizer extension from VS Code
  use "numToStr/Comment.nvim" -- easily comment stuff
  use "lewis6991/gitsigns.nvim"
  use "nvim-lualine/lualine.nvim"
  use { "akinsho/toggleterm.nvim", tag = "*" }
  use "folke/which-key.nvim"
  use {
    'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
  }
  use "RRethy/nvim-treesitter-endwise" -- adds "end" in ruby, Lua, Vimscript, etc
  use "norcalli/nvim-colorizer.lua"
  use "tpope/vim-surround" -- surroundings for "", '', (), {}, etc
  use "windwp/nvim-ts-autotag" -- uses treesitter to autoclose/rename tags

  -- bufferline
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons' } -- buffer tabs
  use "moll/vim-bbye" -- provides :Bdelete! to close buffer with <C-w>

  -- color schemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'Mofiqul/dracula.nvim', as = 'dracula' }
  use { 'marko-cerovac/material.nvim', as = 'material' }
  use { 'EdenEast/nightfox.nvim', as = 'nightfox' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'folke/tokyonight.nvim', as = 'tokyonight' }

  -- cmp plugins
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lua" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- cmdline completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/nvim-cmp" -- the completion plugin

  -- nvim tree
  -- use { 'kyazdani42/nvim-tree.lua', commit = '2e1f82d8c0c57cbc2bfdc041a3aff26947559a1e' }
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- lsp
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- formatting and linters
  use "RRethy/vim-illuminate"

  -- telescope
  use { "nvim-telescope/telescope.nvim", commit = "76120285f88c1becb5728695f6df77c545437c53" }
  use "sharkdp/fd" -- finds entries in file system

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  --[[ use { ]]
  --[[   'nvim-treesitter/nvim-treesitter', ]]
  --[[   run = function() ]]
  --[[     local ts_update = require('nvim-treesitter.install').update({ with_sync = true }) ]]
  --[[     ts_update() ]]
  --[[   end, ]]
  --[[ } ]]
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- automatically set up configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
