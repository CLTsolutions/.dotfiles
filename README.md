# Dotfiles

wip

# Notes

## LSP

### remark (markdown)

`remark_ls` will only work if installed locally in project using `npm i remark`

_See this [issue](https://github.com/williamboman/nvim-lsp-installer/issues/519)_

### solargraph (ruby)

For solargraph to work in projects that include a `.rubocop.yml` file in their root directory, the following code block must be included in your `solargraph.lua` file.

_See this [issue](https://github.com/LunarVim/LunarVim/issues/945)_

````ruby
require('lspconfig').solargraph.setup {
 cmd = { "solargraph", "stdio" }
}

