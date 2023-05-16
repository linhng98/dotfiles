-- copy selected visual block text area to clipboard
vim.keymap.set('v', '<C-c>', '"+y')

-- remove highlight after search
vim.keymap.set('n', '<C-n>', ':noh<CR>')

-- switch tab
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>')

-- save and quit window
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<C-q>', ':wq<CR>')
vim.keymap.set('n', '<C-e>', ':qa!<CR>')

-- resize window
vim.keymap.set('n', '<C-M-h>', ':vertical resize -5<CR>')
vim.keymap.set('n', '<C-M-l>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<C-M-j>', ':horizontal resize -5<CR>')
vim.keymap.set('n', '<C-M-k>', ':horizontal resize +5<CR>')

-- move between window
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-Left>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-Right>', ':wincmd l<CR>')
vim.keymap.set('n', '<C-Down>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-Up>', ':wincmd k<CR>')

