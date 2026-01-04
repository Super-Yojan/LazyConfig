return {
  -- 1. THEME: Oxocarbon (Industrial Futurist)
  -- Replaces Catppuccin to match the Red/Black/White brand.
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false, -- Load immediately during startup
    priority = 1000, -- Load before all other UI plugins
    config = function()
      -- Set background to dark (required for Oxocarbon)
      vim.opt.background = "dark"

      -- Load the colorscheme
      vim.cmd("colorscheme oxocarbon")

      -- OPTIONAL: Force the background to match WezTerm/Zellij exactly (#161616)
      -- Use this if you see any slight mismatch in colors.
      vim.api.nvim_set_hl(0, "Normal", { bg = "#161616" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#161616" })
    end,
  },
}
