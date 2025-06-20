return {
	"nvim-treesitter/nvim-treesitter",
	-- branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"nix",
				"fish",
				"bash",
				"c",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
		})
	end,
}
