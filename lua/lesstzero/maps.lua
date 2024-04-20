vim.g.mapleader = " "
local keyset = vim.keymap.set
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

keyset("v", "J", ":m '>+1<CR>gv=gv") -- moving the line up
keyset("v", "K", ":m '<-2<CR>gv=gv")
-- keyset("n", "<C-d>", "<C-d>zz")
-- keyset("n", "<C-u>", "<C-u>zz")
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")


-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])

vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
-- Move cursor right in insert mode with Ctrl+l
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })
-- Move cursor down in insert mode with Ctrl+j
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
-- Move cursor up in insert mode with Ctrl+k
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })

keyset("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keyset('n', '<C-h>', '<C-w>h', { noremap = true })
-- move to the window to the down
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
-- move to the window to the up
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
-- move to the window to the right
keyset('n', '<C-l>', '<C-w>l', { noremap = true })
keyset('n', 'x', '"_x', { noremap = true })
keyset('n', '<S-l>', ':bnext<CR>', { noremap = true })
keyset('n', '<S-h>', ':bpre<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', {noremap=true})
keyset('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { noremap = true })
keyset('t', '<C-[>', '<C-\\><C-n>', { noremap = true })
-- Remap j to use the fast key code sequence
keyset('n', 'j', 'gj', { noremap = true, silent = true })
keyset('n', 'k', 'gk', { noremap = true, silent = true })
keyset('n', '<Space>bw', ':bwipeout<CR>', { noremap = true })

-- vim.cmd('let g:multi_cursor_use_default_mapping=0')
