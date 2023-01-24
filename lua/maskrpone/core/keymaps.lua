vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

-- for split screen

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

-- for tabulation

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- plugin keymaps

-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- for NerdTree plugin
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- for telescope and fzf

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- for cmake

keymap.set("n", "<leader>cp", ":CMake create_project<cr>") -- create cmake project
keymap.set("n", "<leader>ba", ":CMake build_all<cr>") -- building project

-- for Floaterm
keymap.set("n", "<leader>ft", ":FloatermToggle<cr>")
