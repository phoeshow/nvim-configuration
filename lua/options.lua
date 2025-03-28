-- See `:help vim.opt`
-- NOTE: For more options, see `:help option-list`

-- Make line number default and relative line number on to help with jump
vim.opt.number = true
vim.opt.relativenumber = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Minimal number of screen lines/columns to keey around the cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5

-- Enable mouse mode
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Complete
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.wildmode = "longest:full,full"

-- Enable breakindent
vim.opt.breakindent = true
-- Copy indent from current line when startinga new line
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Split window
vim.opt.splitright = true
vim.opt.splitbelow = true

-- <tab> key
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Wrap
vim.opt.wrap = false
vim.opt.whichwrap = "<,>,[,]"

-- textwidth 80
vim.opt.textwidth = 80
vim.opt.colorcolumn = '80'

-- Sets how neovim display certain whitespace characters in the editor
vim.opt.list = true

-- [[ UI ]]
-- Don't show mode, use lualine instead
vim.opt.showmode = false
-- Display cursor line
vim.opt.cursorline = true
-- Use 24-bit color
vim.opt.termguicolors = true
-- Always display tab line
vim.opt.showtabline = 2
-- Display status line at last window
vim.opt.laststatus = 3

-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"
