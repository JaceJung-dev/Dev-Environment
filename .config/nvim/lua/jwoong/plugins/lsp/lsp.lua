return {
	"hrsh7th/cmp-nvim-lsp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Retrieve Python venv
		local function get_python_path()
			local venv_paths = { ".venv", "venv" }
			local cwd = vim.fn.getcwd()

			for _, venv in ipairs(venv_paths) do
				local venv_python = cwd .. "/" .. venv .. "/bin/python"
				if vim.fn.filereadable(venv_python) == 1 then
					return venv_python
				end
			end

			return vim.fn.exepath("python3") or vim.fn.expath("python") or "python"
		end

		-- pyright setup
		vim.lsp.config.pyright = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
			capabilities = capabilities,
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

		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end,
}
