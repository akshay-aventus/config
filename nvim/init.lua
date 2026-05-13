require("options")
require("keymaps")
require("autocmds")

-- require("config.lsp")
require("config.plugins")

require("plugins.mason")
-- require("plugins.conform")
require("plugins.theme")

require("vim._core.ui2").enable({ enable = true })

vim.diagnostic.config({
	update_in_insert = true,
	severity_sort = true,
	float = { source = "if_many" },
	underline = true,
	virtual_text = false,
	virtual_lines = false,
	jump = { float = true },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescriptreact" },
	callback = function()
		vim.bo.omnifunc = "javascriptcomplete#CompleteJS"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "typescriptreact", "javascriptreact", "typescript", "javascript" },
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- configuration
require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
		selection_modes = {
			["@parameter.outer"] = "v", -- charwise
			["@function.outer"] = "V", -- linewise
		},
		include_surrounding_whitespace = false,
	},
})

-- keymaps
-- You can use the capture groups defined in `textobjects.scm`
vim.keymap.set({ "x", "o" }, "am", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "im", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]m", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "[m", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
