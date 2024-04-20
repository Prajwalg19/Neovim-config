return {
    "nvim-tree/nvim-tree.lua",
    lazy=false,
    -- event="VeryLazy",
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        -- optionally enable 24-bit colour
        vim.opt.termguicolors = true
        -- OR setup with some options
        vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
                relativenumber = true,
            },
            renderer = {
                group_empty = true,
            },
        })
    end
}
