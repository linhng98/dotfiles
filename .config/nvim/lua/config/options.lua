-- Auto jump to previous working line
-- https://www.reddit.com/r/neovim/comments/125gctj/e5248_invalid_character_in_group_name_with/
vim.cmd([[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    au BufRead,BufNewFile *.tfvars set filetype=terraform
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

-- Detect filetype
vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
    hcl = 'hcl',
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})
