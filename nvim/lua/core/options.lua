-- Options configuration
local opt = vim.opt

-- Clipboard
opt.clipboard = "unnamedplus"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.wrap = true
opt.linebreak = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0

-- Files
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append("c")

-- Timing
opt.updatetime = 250
opt.timeoutlen = 300

-- Misc
opt.mouse = "a"
opt.hidden = true
opt.fillchars = { eob = " " }
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split"
opt.confirm = true

-- Folding (using treesitter - native Neovim 0.10+)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.foldenable = false
opt.foldlevel = 99
opt.foldlevelstart = 99
