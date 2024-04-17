vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- moving the line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.cmd([[
    augroup auto_format_on_save
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.format()
    augroup END
]])


-- Move cursor left in insert mode with Ctrl+h
-- vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
-- -- Move cursor right in insert mode with Ctrl+l
-- vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })
-- -- Move cursor down in insert mode with Ctrl+j
-- vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
-- -- Move cursor up in insert mode with Ctrl+k
-- vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })
-- move to the window to the left
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
-- move to the window to the down
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
-- move to the window to the up
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
-- move to the window to the right
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':bpre<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', {noremap=true})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true })
-- Remap j to use the fast key code sequence
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>bw', ':bwipeout<CR>', { noremap = true })
