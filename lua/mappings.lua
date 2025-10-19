require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Copilot Accept
map('i', '<C-j>', function ()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })

-- For moving lines of code
-- Move line down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
-- Move selected lines down/up in visual mode
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
