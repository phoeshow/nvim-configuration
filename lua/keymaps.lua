local map = vim.keymap.set

-- Split window
map("n", "<leader>wh", "<CMD>split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>w-", "<CMD>split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>wv", "<CMD>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>w\\", "<CMD>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>wd", "<c-w>c", { desc = "Delete window" })

-- Move to window useing the <ctrl>hjkl keys
map({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>", { desc = "Go to Left Window" })
map({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>", { desc = "Go to Lower Window" })
map({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>", { desc = "Go to Upper Window" })
map({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>", { desc = "Go to Right Window" })

-- Resize window useing <ctrl> arrow keys
map("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase Window Width" })

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", noremap = true, silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down", noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up", noremap = true, silent = true })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down", noremap = true, silent = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up", noremap = true, silent = true })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Clear search highlight
map("n", "<ESC>", "<CMD>nohlsearch<CR>")

-- Increase/Decrease number useing '+/-' keys
map("n", "+", "<C-a>", { desc = "Increase number" })
map("n", "-", "<C-x>", { desc = "Decrease number" })
