local obsidian_path = string.format("%s/obsidian", vim.fn.expand("~"))

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- If obsidian_path doesn't exist don't load
	cond = function()
		return vim.fn.isdirectory(obsidian_path) ~= 0
	end,
	event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		string.format("BufReadPre %s/*.md", obsidian_path),
		string.format("BufNewFile %s/*.md", obsidian_path),
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		workspaces = {
			{
				name = "obsidian",
				path = obsidian_path,
			},
		},
	},
}
