vim.cmd("let g:netrw_liststyle = 3") -- Use tree-style listing in netew (file explore)

local opt = vim.opt

-- tab & indentation
-- opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
-- opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

opt.wrap = false

-- search settings
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true -- ??

-- visual
opt.number = true
opt.relativenumber = true

-- color
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as defaulf register

-- split window
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- file auto reload
opt.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	pattern = "*",
	command = "checktime",
})

-- search project root directory venv (python)
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		local venv_paths = { ".venv", "venv", ".env" }

		for _, venv in ipairs(venv_paths) do
			local venv_python = vim.fn.getcwd() .. "/" .. venv .. "/bin/python"
			if vim.fn.filereadable(venv_python) == 1 then
				vim.g.python3_host_prog = venv_python
				break
			end
		end
	end,
})

-- etc
opt.encoding = "UTF-8"
opt.cmdheight = 1
opt.scrolloff = 10
opt.mouse:append("a")
