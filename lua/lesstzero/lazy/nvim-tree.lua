return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggles nvim tree" },
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        -- optionally enable 24-bit colour
        vim.opt.termguicolors = true
        -- OR setup with some options
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
