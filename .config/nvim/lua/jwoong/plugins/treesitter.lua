return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- main branch does not support lazy-loading
	build = ":TSUpdate",
	config = function()
		-- Parsers to install (async background install on first run)
		local ensure_installed = {
			-- Python & Data science
			"python",
			-- C/C++
			"c",
			"cpp",
			"cmake",
			-- Web Development
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			-- Rust
			"rust",
			"toml",
			-- Go
			"go",
			"gomod",
			"gosum",
			"gowork",
			-- Config & Data formats
			"json",
			"yaml",
			-- Documentation
			"markdown",
			"markdown_inline",
			-- Neovim config
			"lua",
			"luadoc",
			"vim",
			"vimdoc",
			-- Shell / Container
			"bash",
			"dockerfile",
			-- Required by treesitter query files
			"query",
		}

		require("nvim-treesitter").install(ensure_installed)

		-- Use bash parser for zsh files (Neovim core API, unchanged in main)
		vim.treesitter.language.register("bash", "zsh")

		-- main branch does not auto-start treesitter; enable hl/indent per filetype
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				if ft == "" then
					return
				end
				local lang = vim.treesitter.language.get_lang(ft) or ft
				local ok = pcall(vim.treesitter.language.add, lang)
				if not ok then
					return
				end
				pcall(vim.treesitter.start, args.buf, lang)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
