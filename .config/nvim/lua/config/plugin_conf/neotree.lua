require("nvim-tree").setup({
	filters = {
		dotfiles = false,
		git_ignored = false,
	},
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  view = {
    preserve_window_proportions = true
  },
})
