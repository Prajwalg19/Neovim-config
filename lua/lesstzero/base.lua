local g = vim.g
local o = vim.o
local opt = vim.opt
-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')

o.signcolumn = "yes"
-- Map <leader> to space
g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
o.termguicolors = true
-- o.background = 'dark'
opt.shortmess:append "sI" -- remove nvim intro
-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50
opt.mouse = "a"
--
-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- lower the lualine
o.cmdheight = 0
-- this is a quick scope config , i am placing this here because it only works when this is applied in the init files
vim.cmd("let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']")
