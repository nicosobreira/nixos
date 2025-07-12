return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "BurntSushi/ripgrep" },
		{ "nvim-treesitter/nvim-treesitter" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- If `make` isn't installed don't load
			cond = function()
				return vim.fn.executable("make") ~= 0
			end,
			build = "make",
		},
	},
	cmd = { "Telescope" },
	opts = {
		defaults = {
			file_ignore_patterns = {
				"^.git/",
				"%.o",
			},
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "[f]ind [f]iles",
		},
		{
			"<space>fa",
			function()
				require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true })
			end,
			desc = "[f]ind [a]ll files",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "[f]ind [w]ords",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "[f]ind [h]elp pages",
		},
		{
			"<leader>fm",
			function()
				require("telescope.builtin").man_pages()
			end,
			desc = "[f]ind [m]an pages",
		},
	},
}
