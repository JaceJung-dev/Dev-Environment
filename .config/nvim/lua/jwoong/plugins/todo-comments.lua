return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    todo_comments.setup({
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]], -- 콜론 제거, 공백만 허용
      },
      search = {
        pattern = [[\b(KEYWORDS)\b]], -- 단어 경계만 체크
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })
  end,
}
