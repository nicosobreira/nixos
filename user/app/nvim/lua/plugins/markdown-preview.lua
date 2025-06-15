return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	cond = function()
		return vim.fn.executable("npm") ~= 0
	end,
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	build = "cd app && npm install",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	keys = {
		{
			"<leader>.",
			"<cmd>MarkdowmPreviewToggle<CR>",
			desc = "Toggle Markdown Preview"
		},
	},
}
