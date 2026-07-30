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
        "emmet_ls", -- HTML/JSX abbreviation expansion
        "pyright", -- python
        "gopls", -- Go
        "docker_language_server", -- Dockerfile/Compose/Bake
        "ltex", -- spell/grammar check
      },
      -- Installed mason packages are auto-enabled as LSP servers when they have
      -- an lspconfig mapping. stylua is a formatter run through conform, so its
      -- LSP would only add an idle client on every lua buffer.
      automatic_enable = {
        exclude = { "stylua" },
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
