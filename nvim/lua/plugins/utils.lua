-- lua/plugins/utils.lua
return {
  -- Project Session management
  {
    "Shatur/neovim-session-manager",
    cmd = "SessionManager",
  },
  -- Todo comments for your paper (finds TODO/FIXME in your LaTeX)
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
