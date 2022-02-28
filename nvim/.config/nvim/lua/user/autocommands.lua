vim.cmd [[
  augroup _general_settings
    autocmd! 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 400})
  augroup end

  " augroup _git
  "   autocmd!
  "   autocmd FileType gitcommit setlocal wrap
  "   autocmd FileType gitcommit setlocal spell
  "   autocmd FileType gitcommit set colorcolumn=51,73
  " augroup end
]]
