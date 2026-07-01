return {
  "saecki/crates.nvim",
  tag = "stable",
  -- Cargo.toml 을 열 때만 로드 (crates.nvim 은 Cargo.toml 전용)
  event = { "BufRead Cargo.toml" },
  config = function()
    require("crates").setup()
  end,
}
