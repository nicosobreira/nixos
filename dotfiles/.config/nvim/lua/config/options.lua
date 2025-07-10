-- Initialize with default options
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

-- Basic settings
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.encoding = "utf-8"
vim.opt.showmode = true
vim.opt.scrolloff = 10
vim.opt.backspace = { "indent", "eol", "start" }

-- Undo
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.conceallevel = 2 -- Don't hide markup
vim.opt.concealcursor = "" -- Don't hide cursor line markup
vim.opt.lazyredraw = true -- Don't redraw during macros
vim.opt.synmaxcol = 300 -- Syntax highlighting limit

-- Spell check
vim.opt.spelllang = "en"

-- Indentation
local tabSize = 2

vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.tabstop = tabSize
vim.opt.shiftwidth = tabSize
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Visual whitespace
vim.opt.listchars = { tab = "| ", trail = "*" }
vim.o.list = true

-- Clipboard
vim.schedule(function()
	vim.opt.clipboard:append("unnamedplus")
end)

-- Auto comment
vim.opt.formatoptions = "cro"

-- Status line
vim.opt.laststatus = 2
vim.opt.confirm = true
vim.opt.title = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "fuzzy"

-- Netrw settings
vim.g.netrw_list_hide = "^\\./$,^\\.\\./$"
vim.g.netrw_browse_split = 0
vim.g.netrw_hide = 1
vim.g.netrw_banner = 0
vim.g.netrw_altfile = 1
vim.g.netrw_alto = 1

-- Cursor shape
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Key timeout duration

-- Custom Tabline
vim.opt.tabline = "%!v:lua.require('custom.tabline').get()"
