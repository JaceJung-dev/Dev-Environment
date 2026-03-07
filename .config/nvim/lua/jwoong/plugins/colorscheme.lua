return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",

      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.10,
      },

      transparent_background = false,

      custom_highlights = function(colors)
        return {
          IblIndent = { fg = colors.surface2 },
          IblWhitespace = { fg = colors.surface2 },
        }
      end,

      integrations = {
        treesitter = true,
        which_key = true,
        mason = true,
        indent_blankline = { enabled = true },

        native_lsp = {
          enabled = true,
          semantic_tokens = true,
        },

        render_markdown = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
