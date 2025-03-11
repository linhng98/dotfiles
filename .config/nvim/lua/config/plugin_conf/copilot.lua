vim.g.copilot_filetypes = { xml = false }

vim.keymap.set("i", "<M-Right>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.keymap.set("i", "<M-Up>", "<Plug>(copilot-previous)", {})
vim.keymap.set("i", "<M-Down>", "<Plug>(copilot-next)", {})
vim.g.copilot_no_tab_map = true
