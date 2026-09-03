return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })

      -- Picks github_dark_default / github_light_default based on the macOS
      -- appearance and keeps following it while Neovim runs.
      require("config.theme").setup()
    end,
  },
}
