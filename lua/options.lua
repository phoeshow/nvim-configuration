-- See `:help vim.opt`
-- NOTE: For more options, see `:help option-list`

local opt = vim.o

-- Make line number default and relative line number on to help with jump
opt.number = true
opt.relativenumber = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Minimal number of screen lines/columns to keey around the cursor
opt.scrolloff = 8
opt.sidescrolloff = 5

-- Enable mouse mode
opt.mouse = "a"

-- Sync clipboard between OS and Neovim
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

-- Complete
opt.completeopt = "menu,menuone,noselect"
opt.wildmode = "longest:full,full"

-- Enable breakindent
opt.breakindent = true
-- Copy indent from current line when startinga new line
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Split window
opt.splitright = true
opt.splitbelow = true

-- <tab> key
opt.shiftwidth = 2
opt.smarttab = true
opt.expandtab = true
opt.softtabstop = 2
opt.tabstop = 2

-- Wrap
opt.wrap = false
opt.whichwrap = "<,>,[,]"

-- Sets how neovim display certain whitespace characters in the editor
opt.list = true

-- [[ UI ]]
-- Don't show mode, use lualine instead
opt.showmode = false
-- Display cursor line
opt.cursorline = true
-- Use 24-bit color
opt.termguicolors = true
-- Always display tab line
opt.showtabline = 2
-- Display status line at last window
opt.laststatus = 3

-- Decrease update time
opt.updatetime = 250
-- Decrease mapped sequence wait time
opt.timeoutlen = 300

-- fold
-- opt.foldmethod = "expr"
-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = false

-- encoding
opt.encoding = "utf-8"
opt.fileencodings = "ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"
