
local g = vim.g
local o = vim.o
local opt = vim.opt
-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
o.termguicolors = true
-- o.background = 'dark'

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

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- lower the lualine
o.cmdheight = 0
-- Preserve view while jumping
-- BUG This option causes an error!
-- o.jumpoptions = 'view'

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1
--
opt.mouse = "a"

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

-- nvim tree
require("nvim-tree").setup({
  update_focused_file = {
  enable = true,
  update_root = true,
   }  ,
  view = {relativenumber = true},
  sort_by = "modification_time",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
tabline = {
  lualine_a = {
      "buffers"
       },
  lualine_b = {},
  -- lualine_c = {'filename'},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {"tabs"}
},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

if vim.g.coc_enabled then
  -- Set up coc-emmet for JavaScript files (JavaScriptReact)
  vim.cmd([[
    autocmd FileType javascript setlocal cocu_regexps='javascriptreact:\s*\(\k\|$\w\)\+\|\%(\k\|$\w\)\+\%'
  ]])
end



-- local on_attach = function(client, bufnr)
--   require("tailwindcss-colors").buf_attach(bufnr)
-- end

require("conform").setup({
  formatters_by_ft = {
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    java = {  "astyle" },
    typescript={"prettierd"},
    html={{"prettierd"}},
    c={"astyle"},
    cpp ={"astyle"},
    tsx={"prettierd"},
    jsx={"prettierd"},
  },
})


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

require("telescope").load_extension("persisted")

require("tokyonight").setup({
  -- use the night style
  style = "night",
  -- disable italic for functions
  transparent=true,
 styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  sidebars = { "qf", "vista_kind", "terminal", "packer", "telescope"},
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
    colors.bg="#0b0b0f"
    colors.bg_sidebar="#0b0b0f"
    colors.purple="#9d7cd8"
    colors.bg_dark = "#0b0b0f"
   colors.bg_statusline = colors.bg_dark
   colors.bg_float= "#0b0b0f"
  colors.border = colors.purple
  end
})

