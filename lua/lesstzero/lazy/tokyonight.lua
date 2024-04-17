return {

    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- require("telescope").load_extension("persisted")
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
    vim.cmd([[colorscheme tokyonight-night]])

  end,

}
