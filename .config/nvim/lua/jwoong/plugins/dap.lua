return {
  -- 핵심 DAP 클라이언트
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DiagnosticWarn" })
      vim.fn.sign_define("DapStopped", { text = "→", texthl = "DiagnosticOk", linehl = "DiffAdd" })
    end,
    dependencies = {
      -- Mason 브릿지 (디버그 어댑터 자동 설치)
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason-org/mason.nvim",
        opts = {
          ensure_installed = {
            "python", -- debugpy
            "codelldb", -- C/C++
            "js", -- vscode-js-debug (JS/TS)
          },
          handlers = {}, -- 기본 핸들러 적용 (필수)
        },
      },
      -- 디버깅 UI
      {
        "rcarriga/nvim-dap-ui",
        dependencies = "nvim-neotest/nvim-nio",
        config = function()
          local dap, dapui = require("dap"), require("dapui")
          dapui.setup()
          -- 디버깅 시작 시 UI 자동 열기
          dap.listeners.before.attach.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.launch.dapui_config = function()
            dapui.open()
          end
          -- 디버깅 종료 시 UI 자동 닫기
          dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
          end
          dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
          end
        end,
      },
      -- 변수 값 인라인 표시
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    keys = {
      {
        "<F2>",
        function()
          require("dap").continue()
        end,
        desc = "Continue / Start",
      },
      {
        "<F3>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<F4>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<F5>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Conditional Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue / Start",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle DAP UI",
      },
      {
        "<leader>dw",
        function()
          require("dapui").elements.watches.add(vim.fn.expand("<cword>"))
        end,
        desc = "Add to Watches",
      },
      {
        "Q",
        function()
          require("dapui").eval()
        end,
        mode = { "n", "v" },
        desc = "Hover Eval",
      },
    },
  },

  -- Python 전용 확장
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    end,
    keys = {
      {
        "<leader>dpt",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Test Method",
        ft = "python",
      },
      {
        "<leader>dpc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Test Class",
        ft = "python",
      },
    },
  },
}
