-- Auto jump to previous working line
vim.cmd([[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
]])

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
