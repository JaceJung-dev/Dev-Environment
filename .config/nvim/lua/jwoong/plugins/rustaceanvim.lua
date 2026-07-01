return {
  "mrcjkb/rustaceanvim",
  -- rustaceanvim은 자체적으로 filetype 기반 lazy-load를 처리하므로 lazy = false 권장
  lazy = false,
  init = function()
    vim.g.rustaceanvim = function()
      -- nvim-cmp 자동완성 capabilities 연동 (다른 LSP 서버와 동일 수준)
      local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

      return {
        server = {
          capabilities = ok and cmp_nvim_lsp.default_capabilities() or nil,
          default_settings = {
            ["rust-analyzer"] = {
              -- 저장 시 clippy 진단
              checkOnSave = true,
              check = { command = "clippy" },
              -- inlay hints (실제 표시는 vim.lsp.inlay_hint.enable 필요)
              inlayHints = { enable = true },
              cargo = { allFeatures = true },
            },
          },
          on_attach = function(_, bufnr)
            -- rust 버퍼에서만 K / <leader>ca 를 rustaceanvim 강화판으로 덮어씀.
            -- 전역 LspAttach(jwoong.lsp) 매핑 뒤에 실행되도록 vim.schedule 로 지연.
            vim.schedule(function()
              if not vim.api.nvim_buf_is_valid(bufnr) then
                return
              end
              local opts = { buffer = bufnr, silent = true }

              opts.desc = "Rust hover actions"
              vim.keymap.set("n", "K", function()
                vim.cmd.RustLsp({ "hover", "actions" })
              end, opts)

              opts.desc = "Rust code action (grouped)"
              vim.keymap.set({ "n", "v" }, "<leader>ca", function()
                vim.cmd.RustLsp("codeAction")
              end, opts)

              opts.desc = "Rust expand macro"
              vim.keymap.set("n", "<leader>rm", function()
                vim.cmd.RustLsp("expandMacro")
              end, opts)

              opts.desc = "Rust explain error"
              vim.keymap.set("n", "<leader>re", function()
                vim.cmd.RustLsp("explainError")
              end, opts)
            end)
          end,
        },
        dap = {
          -- codelldb(mason) 자동 탐지 → nvim-dap 설정 자동 등록
          autoload_configurations = true,
        },
      }
    end
  end,
}
