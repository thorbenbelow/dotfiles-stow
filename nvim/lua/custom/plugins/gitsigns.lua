return { -- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 0,
		},
		signs = {
			add = { text = "🔥" },
			change = { text = "👀" },
			delete = { text = "😭" },
			topdelete = { text = "😭" },
			changedelete = { text = "👀" },
		},
	},
}
