return {
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      -- Uncomment a picker that you want to use, snacks.nvim might be additionally
      -- useful to show previews and failing snapshots.

      -- You must select at least one:
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      "folke/snacks.nvim", -- (optional) to show previews

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
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        swift = { "swiftlint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
        group = lint_augroup,
        callback = function()
          if not vim.endswith(vim.fn.bufname(), "swiftinterface") then
            require("lint").try_lint()
          end
        end,
      })

      vim.keymap.set("n", "<leader>ml", function()
        require("lint").try_lint()
      end, { desc = "Lint file" })
    end,
  },
}
