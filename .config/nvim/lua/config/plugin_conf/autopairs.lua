local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")

-- change default fast_wrap
npairs.setup({
	enable_check_bracket_line = false,
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%>%]%)%}%,]]=],
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})
