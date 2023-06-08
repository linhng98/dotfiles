require("bufferline").setup({
	options = {
		highlights = {
			fill = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},
			background = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},

			-- buffer_selected = {
			--   guifg = {attribute='fg',highlight='#ff0000'},
			--   guibg = {attribute='bg',highlight='#0000ff'},
			--   gui = 'none'
			--   },
			buffer_visible = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},

			close_button = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},
			close_button_visible = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},
			-- close_button_selected = {
			--   guifg = {attribute='fg',highlight='TabLineSel'},
			--   guibg ={attribute='bg',highlight='TabLineSel'}
			--   },

			tab_selected = {
				fg = { attribute = "fg", highlight = "Normal" },
				bg = { attribute = "bg", highlight = "Normal" },
			},
			tab = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},
			tab_close = {
				-- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
				fg = { attribute = "fg", highlight = "TabLineSel" },
				bg = { attribute = "bg", highlight = "Normal" },
			},

			duplicate_selected = {
				fg = { attribute = "fg", highlight = "TabLineSel" },
				bg = { attribute = "bg", highlight = "TabLineSel" },
				italic = true,
			},
			duplicate_visible = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
				italic = true,
			},
			duplicate = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
				italic = true,
			},

			modified = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},
			modified_selected = {
				fg = { attribute = "fg", highlight = "Normal" },
				bg = { attribute = "bg", highlight = "Normal" },
			},
			modified_visible = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},

			separator = {
				fg = { attribute = "bg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},
			separator_selected = {
				fg = { attribute = "bg", highlight = "Normal" },
				bg = { attribute = "bg", highlight = "Normal" },
			},
			-- separator_visible = {
			--   guifg = {attribute='bg',highlight='TabLine'},
			--   guibg = {attribute='bg',highlight='TabLine'}
			--   },
			indicator_selected = {
				fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
				bg = { attribute = "bg", highlight = "Normal" },
			},
		},
		separator_style = "slant",
		offsets = {
			{
				filetype = "NvimTree",
				text = "NvimTree",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
	},
})
