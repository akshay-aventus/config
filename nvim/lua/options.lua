vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true

vim.o.relativenumber = true
vim.o.number = true

vim.opt.undodir = os.getenv("~/.vim/undodar")
vim.opt.undofile = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.o.splitright = true
vim.opt.scrolloff = 8
vim.o.incsearch = true
vim.o.ignorecase = false
vim.o.smartcase = true

vim.opt.wrap = false
vim.opt.colorcolumn = "80"

vim.opt.cursorline = true
vim.diagnostic.config({
	update_in_insert = true,
	severity_sort = true,
	float = { source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },

	virtual_text = false,
	virtual_lines = false,

	jump = { float = true },
})

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 8
vim.opt.smartindent = true

vim.opt.updatetime = 50

vim.opt.statusline = "%f%h%m%r%w%=  %y %l,%c | %P | %{strftime('%H:%M')}"

vim.opt.shortmess:append("c")
vim.opt.completeopt = { "popup", "menuone", "noinsert", "fuzzy", "preview" }

vim.opt.path = { ".", "**" }
vim.opt.wildignore:append({
	"**/node_modules/**",
	"**/dist/**",
	"**/build/**",
	"**/.git/**",
	"**/.next/**",
	"**/.turbo/**",
	"**/.cache/**",
	"**/coverage/**",
	"**/out/**",
})
