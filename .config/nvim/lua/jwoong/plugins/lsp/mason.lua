return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- list of servers of mason to install
      ensure_installed = {
        "lua_ls", -- lua
        "clangd", -- C/C++
        "ts_ls", -- JavaScript/TypeScript
        "html", -- HTML
        "cssls", -- CSS
        "tailwindcss", -- Tailwind CSS
        "pyright", -- python
        "ltex", -- spell/grammar check
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "isort",
        "black",
        "ruff",
        "eslint_d",
      },
    },
    dependencies = {
      "mason-org/mason.nvim",
    },
  },
}
