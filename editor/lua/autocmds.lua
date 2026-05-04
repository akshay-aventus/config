local highlightGroup = vim.api.nvim_create_augroup("highlight-yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Hightlight when yanking (copying) text",
	group = highlightGroup,
	callback = function()
		vim.highlight.on_yank({ timeout = 80 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		vim.opt_local.path = { ".", "**" }
	end,
})
