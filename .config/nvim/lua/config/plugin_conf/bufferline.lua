require("bufferline").setup {
  options = {
    separator_style = "slant",
    indicator = {
      style = "underline",
    },
    offsets = {
      {
          filetype = "NvimTree",
          text = "NvimTree",
          highlight = "Directory",
          separator = true -- use a "true" to enable the default, or set your own character
      }
    },
  }
}

