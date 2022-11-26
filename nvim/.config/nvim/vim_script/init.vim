" set t_Co=256
set termguicolors

"=======
"plugins
"=======
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-tmux-navigator'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" file explorer & fzf
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" language pack
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'norcalli/nvim-colorizer.lua'

" colorschemes
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'p00f/nvim-ts-rainbow'

call plug#end()

" color highlighter
lua require'colorizer'.setup()

"==============
"color settings
"==============
let g:palenight_terminal_italics = 1

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1

" colorscheme monokai
" colorscheme palenight
" colorscheme rose-pine-light
" colorscheme rose-pine-dark
colorscheme tokyonight

"==============
"basic settings
"==============
" changes markdown code block colors
let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css']

syntax on
set belloff=all
set background=dark
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set incsearch
set mouse=a
set nu rnu
set ruler
set scrolloff=8

" setting spaces
set expandtab
set tabstop=2
set shiftwidth=2

set wildmenu
set wildmode=longest:full,full

"=======
"remaps
"=======
inoremap jj <ESC>

" moving lines up and down quickly like in VS Code
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"=====
"misc
"=====
" built in nvim functions
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END

" in Git commit messages, highlight column 51 and 73 as length guides
autocmd FileType gitcommit set colorcolumn=51,73

" treesitter modules
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
}
EOF
