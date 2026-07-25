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
        "gopls", -- Go
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
        "goimports", -- Go formatter (gofmt + import 정리)
        "golangci-lint", -- Go linter
      },
    },
    dependencies = {
      "mason-org/mason.nvim",
    },
  },
}
