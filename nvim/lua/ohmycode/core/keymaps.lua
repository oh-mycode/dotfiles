vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader><tab><tab>", ":set invlist<CR>")

-- greatest remap ever
keymap.set("n", "x", '"_x')
keymap.set("v", "<leader>p", "\"_dP")

-- comment a line
keymap.set("n", "<leader>/", "gcc")
keymap.set("v", "<leader>/", "gcc")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

keymap.set("n", "<leader>rs", ":LspRestart<CR>")

