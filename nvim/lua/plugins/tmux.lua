return { {
  "aserowy/tmux.nvim",
  lazy = false,
  init = function()
    return require("tmux").setup()
  end,
} }
