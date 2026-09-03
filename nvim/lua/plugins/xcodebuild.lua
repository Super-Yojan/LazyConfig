return {
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      -- Uncomment a picker that you want to use, snacks.nvim might be additionally
      -- useful to show previews and failing snapshots.

      -- You must select at least one:
      -- "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      -- "folke/snacks.nvim", -- (optional) to show previews

      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-tree.lua", -- (optional) to manage project files
      "stevearc/oil.nvim", -- (optional) to manage project files
      "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
    },
    config = function()
      require("xcodebuild").setup({
        -- put some options here or leave it empty to use default settings
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          swift = { "swiftformat" },
        },
        format_on_save = function(bufnr)
          local ignore_filetypes = { "oil" }
          if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
            return
          end

          return { timeout_ms = 500, lsp_fallback = true }
        end,
        log_level = vim.log.levels.ERROR,
      })
    end,
  },
}
