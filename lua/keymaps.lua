local map = vim.keymap.set

-- Split window
map("n", "<leader>wh", "<CMD>split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>wv", "<CMD>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>wd", "<c-w>c", { desc = "Delete window" })

-- Move to window useing the <ctrl>hjkl keys
map("n", "<C-h>", "<c-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<c-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<c-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<c-w>l", { desc = "Go to Right Window" })

-- Resize window useing <ctrl> arrow keys
map("n", "<C-Up>", "<CMD>resize +2<CR>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<CMD>resize -2<CR>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase Window Width" })

-- Move lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Clear search highlight
map("n", "<ESC>", "<CMD>nohlsearch<CR>")

-- Increase/Decrease number useing '+/-' keys
map("n", "+", "<C-a>", { desc = "Increase number" })
map("n", "-", "<C-x>", { desc = "Decrease number" })
