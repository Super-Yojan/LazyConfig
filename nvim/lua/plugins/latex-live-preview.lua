return {
  -- Typst Preview (Optimized for lazy loading)
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {},
  },

  -- Knap (External previewer)
  {
    "frabjous/knap",
    keys = {
      -- Example: F5 to toggle live preview
      {
        "<F5>",
        function()
          require("knap").process_once()
        end,
        desc = "Knap Process Once",
      },
      {
        "<F6>",
        function()
          require("knap").toggle_autopreviewing()
        end,
        desc = "Knap Toggle Auto",
      },
    },
  },

  -- Nabla (LaTeX equations in buffer)
  {
    "jbyuki/nabla.nvim",
    keys = {
      {
        "<leader>p",
        function()
          require("nabla").popup()
        end,
        desc = "Nabla: Equation Popup",
      },
      {
        "<leader>v",
        function()
          require("nabla").enable_virt()
        end,
        desc = "Nabla: Toggle Virtual Text",
      },
    },
    config = function()
      -- Automatically trigger virtual text when you open a file
      require("nabla").enable_virt({
        autogen = true,
        silent = true, -- Set to true to avoid messages on every save
      })
    end,
  },

  -- Global Treesitter config (Move this out if you already have it elsewhere)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "latex", "markdown", "markdown_inline", "typst" },
      highlight = { enable = true },
    },
  },
}
