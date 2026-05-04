return {
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup({
				enabled = true,
				debounce = 150,
				silent = true,
			})
			vim.keymap.set("i", "<C-j>", function()
				neocodeium.cycle_or_complete(-1)
			end)

			vim.keymap.set("i", "<C-k>", function()
				neocodeium.cycle_or_complete(1)
			end)

			vim.keymap.set("i", "<C-l>", function()
				neocodeium.accept()
			end)
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		enabled = true,
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"numToStr/Comment.nvim",
		enabled = true,
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		enabled = true,
		version = "^3.0.0",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"j-hui/fidget.nvim",
		enabled = true,
		opts = {},
	},
	{
		"mason-org/mason.nvim",
		enabled = true,
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		enabled = true,
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		},
	},
	{
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.config").setup({
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
	end,
},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_varint = "main",
				disable_background = true,
				enable = {
					terminal = true,
					legacy_highlights = true,
					migrations = true,
				},
				styles = {

					bold = true,
					italic = false,
					transparency = true,
				},
				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({
				heading = { position = "inline", sign = false, border = false },
			})
		end,
	},
}
