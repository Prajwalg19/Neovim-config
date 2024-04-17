return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    keys = {
        { "<leader>fa", "<cmd>Telescope oldfiles<cr>",    desc = "Telescope" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Telescope" },
        { "<leader>fr", "<cmd>Telescope live_grep<cr>",   desc = "Telescope" },
        { "<leader>ht", "<cmd>Telescope colorscheme<cr>", desc = "Telescope" },

    },
    config = function()
    end

}
