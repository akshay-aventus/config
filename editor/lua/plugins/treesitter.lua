local ts = require("nvim-treesitter")

ts.setup({
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = {
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"html",
	},
})
