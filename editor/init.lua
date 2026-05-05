require("options")
require("keymaps")
require("autocmds")

require("config.lsp")
require("config.plugins")

require("plugins.mason")
require("plugins.conform")
require("plugins.treesitter")
require("plugins.theme")

require("vim._core.ui2").enable({ enable = true })
