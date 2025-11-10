return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		-- Import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- Configure treesitter
		treesitter.setup({
			-- Enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- Enable indentation
			indent = {
				enable = true,
			},
			-- Ensure these language parsers are installed
			ensure_installed = {
				-- Python & Data science
				"python",
				-- C/C++
				"c",
				"cpp",
				-- Web Development
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				-- Config & Data formats
				"json",
				"yaml",
				-- Documentation
				"markdown",
				"markdown_inline",
				-- Neovim config
				"lua",
				"vim",
				-- Optional but useful
				"bash",
				"dockerfile",
			},
			-- Incremental selection based on treesitter
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		-- use bash parser for zsh files
		vim.treesitter.language.register("bash", "zsh")
	end,
}
