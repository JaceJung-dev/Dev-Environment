return {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu", -- default, but explicit
    "--background-index", -- default, but explicit
    "--fallback-style=llvm", -- default, but explicit
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_markers = { "compile_commands.json", ".clangd", ".clang-tidy", ".clang-format", "CMakeLists.txt" },
}
