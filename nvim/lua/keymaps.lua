vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the top window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the bottom window" })

vim.keymap.set("n", "n", "nzzzv", { desc = "center after next search match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "center after previous search match" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "center after half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "center after half page up" })

vim.keymap.set("n", "<leader>fd", ":find ", { desc = "Find file" })
vim.keymap.set("n", "<leader>g", ":grep ", { desc = "Grep" })
vim.keymap.set("n", "<leader>l", ":ls<CR>", { desc = "List buffers" })

