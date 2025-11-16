return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          filetypes = { "markdown", "text", "gitcommit" },

          settings = {
            ltex = {
              language = "en-US", -- 기본 언어는 영어
              additionalRules = {
                motherTongue = "ko-KR", -- 한국어도 같이 고려하도록
              },
            },
          },
        },
      },
    },
  },
}
