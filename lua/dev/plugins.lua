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
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting

	use("nvim-lualine/lualine.nvim") -- A better statusline

	-- File management --
use({
    "https://github.com/nvim-tree/nvim-tree.lua",
    lazy=true
})
	-- use("ryanoasis/vim-devicons")

	-- Tim Pope Plugins --
	use("tpope/vim-surround")

	-- Syntax Highlighting and Colors --
	use("ap/vim-css-color")

    use({ "https://github.com/folke/tokyonight.nvim.git",
    lazy=true,
})

use({
  "neoclide/coc.nvim",
  lazy = true,
})

 use({
     "tpope/vim-commentary",
     lazy=true
 })
     use("jiangmiao/auto-pairs")
     use("prettier/vim-prettier")
 use({
     'nvim-tree/nvim-web-devicons',
     lazy=true
 })
     use({
         'https://github.com/mbbill/undotree',
         lazy=true
     })
     use "nvim-lua/plenary.nvim" 

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

