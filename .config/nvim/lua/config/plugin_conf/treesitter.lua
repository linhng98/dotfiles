require("nvim-treesitter").setup({})

-- The new nvim-treesitter API delegates highlighting to Neovim. Start it for
-- buffers that have an installed parser, except for files larger than 100 KiB.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("config-treesitter", { clear = true }),
  callback = function(args)
    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    if ok and stats and stats.size > 100 * 1024 then
      return
    end

    pcall(vim.treesitter.start, args.buf)
  end,
})

vim.keymap.set("n", "<Leader>t", ":NvimTreeFocus<CR>")
