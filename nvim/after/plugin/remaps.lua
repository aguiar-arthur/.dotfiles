-- Visual mode: Move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true }) -- Move selected line(s) down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true }) -- Move selected line(s) up

-- Normal mode: Improved joining of lines and centering after scrolling
vim.keymap.set("n", "J", "mzJ`z") -- Join lines and restore cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll half-page down and center
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll half-page up and center

-- Visual mode: Paste without overwriting the unnamed register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Normal and Visual modes: Yank to system clipboard and delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- Delete without yanking

-- Normal mode: Navigate through quickfix list with centering
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next item in quickfix list" }) -- Next item in quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous item in quickfix list" }) -- Previous item in quickfix list

-- Normal mode: Search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Normal mode: Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

