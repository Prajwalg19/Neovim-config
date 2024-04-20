return
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            disable_filetype = { "TelescopePrompt", "spectre_panel", "Telescope" },
            enable_check_bracket_line = false,

        })
    end

}
