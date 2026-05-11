vim.lsp.config("*", {
	root_markers = { ".git" },
})

vim.lsp.config("pyright", {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
})

vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
})

vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
})

vim.lsp.config("vtsls", {
	cmd = { "vtsls", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
})

vim.lsp.config("clangd", {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
})

vim.lsp.config("marksman", {
	cmd = { "marksman" },
	filetypes = { "markdown" },
})

vim.lsp.enable({ "lua_ls", "vtsls", "gopls", "marksman", "clangd", "pyright" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLSPConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		local keymap = vim.keymap

		opts.desc = "Workspace Symbol"
		keymap.set("n", "gws", vim.lsp.buf.workspace_symbol, opts)

		opts.desc = "Add Diagnostic to local list"
		keymap.set("n", "gql", vim.diagnostic.setqflist, opts)
	end,
})
