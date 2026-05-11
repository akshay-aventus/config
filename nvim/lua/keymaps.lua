vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the top window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the bottom window" })

vim.keymap.set("n", "n", "nzzzv", { desc = "center after next search match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "center after previous search match" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "center after half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "center after half page up" })

vim.keymap.set("n", "<leader>fd", ":find ", { desc = "Find file" })
vim.keymap.set("n", "<leader>tt", ":tag ", { desc = "Tag" })
vim.keymap.set("n", "<leader>e", ":edit ", { desc = "Edit file" })
vim.keymap.set("n", "<leader>g", ":grep ", { desc = "Grep" })
vim.keymap.set("n", "<leader>b", ":buffer ", { desc = "Switch buffer" })
vim.keymap.set("n", "<leader>d", ":bd ", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>l", ":ls<CR>", { desc = "List buffers" })
vim.keymap.set("n", "<leader>nl", ":nohl<CR>", { desc = "List buffers" })

vim.keymap.set("n", "<leader>tl", function()
	local base = os.getenv("HOME") .. "/notes/logs/"
	local date = os.date("%Y-%m-%d")
	local file = base .. date .. ".md"

	-- ensure directory exists
	vim.fn.mkdir(base, "p")

	-- open file
	vim.cmd("edit " .. file)

	-- if new file, insert header
	if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
		vim.api.nvim_buf_set_lines(0, 0, -1, false, {
			"# " .. date,
			"",
		})
	end
end, { desc = "Open daily log" })
