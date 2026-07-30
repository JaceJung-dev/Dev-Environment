return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			-- Disable auto restore on startup (manual only)
			auto_restore = false,
			-- Don't auto-save session in these directories
			suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>ww", "<cmd>AutoSession search<CR>", { desc = "Session Search" })
		keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })
		keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session for auto session rood dir" })
	end,
}
