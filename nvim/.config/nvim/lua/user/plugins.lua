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


-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so packer doesn't error out on first use
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
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use "p00f/nvim-ts-rainbow" -- like Colorizer extension from VS Code
  use "windwp/nvim-autopairs" -- integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- easily comment stuff
  use "lewis6991/gitsigns.nvim"

    -- bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} -- buffer tabs
  use "moll/vim-bbye"

   -- color schemes
  use { 'folke/tokyonight.nvim', as = 'tokyo night' }
  use { 'rose-pine/neovim', as = 'rose-pine', disable = true, }

   -- cmp plugins
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lua" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- cmdline completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/nvim-cmp" -- the completion plugin
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

      -- nvim tree
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
   -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

   -- lsp
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- formatting

  -- telescope
  use "nvim-telescope/telescope.nvim"

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- adds "end" in ruby, Lua, Vimscript, etc
  use "RRethy/nvim-treesitter-endwise"
  use "norcalli/nvim-colorizer.lua"

  -- automatically set up configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
