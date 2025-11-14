local function get_python_path()
  local venv_paths = { ".venv", "venv" }
  local cwd = vim.fn.getcwd()
  for _, venv in ipairs(venv_paths) do
    local venv_python = cwd .. "/" .. venv .. "/bin/python"
    if vim.fn.filereadable(venv_python) == 1 then
      return venv_python
    end
  end
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
  settings = {
    python = {
      pythonPath = get_python_path(),
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
          reportAttributeAccessIssue = "warning",
        },
      },
    },
  },
}
