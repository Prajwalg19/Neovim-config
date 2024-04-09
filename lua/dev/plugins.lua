local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Dashboard is a nice start screen for nvim

	-- Telescope
 use({
 'nvim-telescope/telescope.nvim', tag = '0.1.4' ,
		requires = { { "nvim-lua/plenary.nvim" } },
	})

 use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting

 use("nvim-lualine/lualine.nvim") -- A better statusline

	-- File management --
 use({
    "https://github.com/nvim-tree/nvim-tree.lua",
})
	-- use("ryanoasis/vim-devicons")

	-- Tim Pope Plugins --
 use("tpope/vim-surround")

	-- Syntax Highlighting and Colors --
 use("ap/vim-css-color")

 --Colorscheme
 use({ "https://github.com/folke/tokyonight.nvim.git",
    lazy=true,
})

--LSP
 use({
  "neoclide/coc.nvim",
  lazy = true,
})

--Comment plugin
 use({
     "tpope/vim-commentary",
     lazy=true
 })
 
-- Bracket,tags,paranthesis pairing
 use("jiangmiao/auto-pairs")
     -- use("prettier/vim-prettier")

     --Icons
 use({
     'nvim-tree/nvim-web-devicons',
     lazy=true
 })

 --Undo history
 use({
         'https://github.com/mbbill/undotree',
         lazy=true
     })

 use "nvim-lua/plenary.nvim" 

 --Formatter
 use "https://github.com/stevearc/conform.nvim"
 

 -- Session Plugin 
use({
  "olimorris/persisted.nvim",
  config = function()
    require("persisted").setup()
  end,
})
-- use {
--   'themaxmarchuk/tailwindcss-colors.nvim',
--   lazy=true,
--   module = "tailwindcss-colors",
--   config = function()
--     require("tailwindcss-colors").setup{}
--   end
-- }

	if packer_bootstrap then
		packer.sync()
	end
end)

