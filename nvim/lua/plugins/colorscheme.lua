return {
  -- Plugin Definitions
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },

  { "rebelot/kanagawa.nvim", opts = {} },
  { "craftzdog/solarized-osaka.nvim", lazy = false, priority = 1000, opts = {} },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  { "olimorris/onedarkpro.nvim", priority = 1000 },
  { "projekt0n/github-nvim-theme" },

  -- LazyVim Configuration
  {
    "LazyVim/LazyVim",
    opts = {
      -- We set a base theme name; the variant (light/dark)
      -- will be determined by the 'background' setting below.
      colorscheme = "github_dark_default",
    },
  },

  -- System Theme Detection Logic
  {
    "folke/persistence.nvim", -- We use a dummy entry here or just a config block
    config = function()
      -- Function to check system appearance (macOS/Linux)
      local function sync_system_theme()
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        local result = handle:read("*a")
        handle:close()

        if result:find("Dark") then
          vim.o.background = "dark"
        else
          vim.o.background = "light"
        end
      end

      -- Run on startup
      sync_system_theme()
    end,
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme github_dark")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme github_light")
      end,
    },
  },
}
