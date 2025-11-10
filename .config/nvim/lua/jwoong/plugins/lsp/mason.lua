return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- list of servers of mason to install
			ensure_installed = {
				"lua_ls", -- lua
				"pyright", -- python
				"clangd", -- C/C++
				"ts_ls", -- JavaScript/TypeScript
				"html", -- HTML
				"cssls", -- CSS
				"tailwindcss", -- Tailwind CSS
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
}
