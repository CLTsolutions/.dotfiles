# Dotfiles

## Installing

_[Video](https://youtu.be/90xMTKml9O0) with step-by-step instructions for storing dotfiles as symlinks_

You will need `git` and [`GNU stow`](https://www.gnu.org/software/stow/).

Clone into your `$HOME` directory or `~`

```bash
git clone git@github.com:CLTsolutions/.dotfiles.git ~
```

Run `stow` to symlink everything or just select what you want

Everything

```bash
stow */ # Everything (the '/' ignores the README)
```

Selected Configs

```bash
stow zsh # Just my zsh config
```

## Notes

### LSP

#### remark (markdown)

`remark_ls` will only work if installed locally in project using `npm i remark`

_See this [issue](https://github.com/williamboman/nvim-lsp-installer/issues/519)_

#### solargraph (ruby)

For solargraph to work in projects that include a `.rubocop.yml` file in their root directory, the following code block must be included in your `solargraph.lua` file.

_See this [issue](https://github.com/LunarVim/LunarVim/issues/945)_

````ruby
require('lspconfig').solargraph.setup {
 cmd = { "solargraph", "stdio" }
}
