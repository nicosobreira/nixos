---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	cond = function()
		return vim.fn.executable("yazi") ~= 0
	end,
	dependencies = {
		-- check the installation instructions at
		-- https://github.com/folke/snacks.nvim
		{
			"folke/snacks.nvim",
			lazy = false,
			priority = 1000,
		},
	},
	keys = {
		{
			"<leader>e",
			group = "File Explorer",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ee",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>ed",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in current directory",
		},
	},
	---@type YaziConfig | {}
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
