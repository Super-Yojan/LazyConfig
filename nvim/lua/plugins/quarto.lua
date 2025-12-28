return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      {
        "jmbuhr/otter.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
          local otter = require("otter")
          -- This initializes the "hidden" buffer logic
          otter.setup({
            lsp = {
              hover = { border = "rounded" },
              -- This ensures snippets and completions work inside the code blocks
              diagnostic_update_events = { "BufWritePost", "InsertLeave" },
            },
            buffers = {
              -- Set to false if you want to manually activate otter
              set_filetype = true,
              write_to_disk = false,
            },
          })
        end,
      },
    },
    opts = {
      lspFeatures = {
        languages = { "rust", "python", "lua", "bash" },
        chunks = "all", -- Use all available code chunks
        diagnostics = { enabled = true },
        completion = { enabled = true },
      },
      codeRunner = {
        enabled = true,
        default_method = "snacks", -- Uses the snacks terminal you already have!
      },
    },
  },
}
