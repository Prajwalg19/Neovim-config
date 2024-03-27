-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------
local ok, _ = pcall(vim.cmd, "colorscheme tokyonight-night")

vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})
