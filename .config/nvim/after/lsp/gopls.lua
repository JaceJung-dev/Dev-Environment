return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      usePlaceholders = true,
      completeUnimported = true,
      -- staticcheck는 golangci-lint에서 담당하므로 중복 진단 방지 위해 gopls에서는 끔
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        nilness = true,
        useany = true,
      },
      -- inlay hints (lsp.lua에서 inlay_hint.enable을 켜면 표시됨)
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
