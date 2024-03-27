-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Mimic shell movements
map("i", "<C-E>", "<ESC>A")
map("i", "<C-A>", "<ESC>I")

-- Load recent sessions
map("n", "<leader>sl", "<CMD>SessionLoad<CR>")

-- Keybindings for telescope
map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")



-- Move cursor left in insert mode with Ctrl+h
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })

-- Move cursor right in insert mode with Ctrl+l
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })

-- Move cursor down in insert mode with Ctrl+j
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })

-- Move cursor up in insert mode with Ctrl+k
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })



vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })







-- move to the window to the left
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })

-- move to the window to the down
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })

-- move to the window to the up
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })

-- move to the window to the right
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })


vim.cmd("inoremap <silent><expr> <c-space> coc#refresh()")

vim.cmd("let g:prettier#autoformat = 1")

vim.cmd("let g:prettier#autoformat_require_pragma = 0")

vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })


vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':bpre<CR>', { noremap = true })

-- vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', {noremap=true})

vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', {noremap=true})
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', {noremap=true})

-- Remap j to use the fast key code sequence
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Space>bw', ':bwipeout<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':UndotreeToggle<CR>', { noremap = true })


    vim.cmd('let mapleader=" "')
    vim.cmd('vnoremap <leader>y y"+ ')
    vim.cmd('nnoremap <leader>y y"+ ')

vim.cmd('let g:multi_cursor_use_default_mapping=0')

-- Set up an autocommand to run :Neoformat uncrustify before saving the file

--float terminal
vim.api.nvim_set_var('floaterm_keymap_toggle', '<Space>fa')


-- Key mappings for scrolling within coc.nvim's floating window
 vim.api.nvim_set_keymap('i', '<C-f>', 'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(1, 1)\\<cr>" : "\\<Right>"', { noremap = true, expr = true, nowait = true })
 vim.api.nvim_set_keymap('i', '<C-b>', 'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(0, 1)\\<cr>" : "\\<Left>"', { noremap = true, expr = true, nowait = true })
vim.api.nvim_set_keymap("i", '<CR>' , 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', {expr=true, noremap=true,silent=true})


