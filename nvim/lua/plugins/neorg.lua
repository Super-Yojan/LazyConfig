-- Neorg + LazyVim (nvim-treesitter main).
-- Parsers ship as luarocks deps; register them into Neovim's treesitter runtime.
return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = false, -- tip of main: required for treesitter `main` compatibility
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neorg/tree-sitter-norg",
      "nvim-neorg/tree-sitter-norg-meta",
    },
    keys = {
      { "<leader>nn", "<cmd>Neorg workspace notes<cr>", desc = "Neorg Notes" },
      { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Neorg Index" },
      { "<leader>nj", "<cmd>Neorg journal today<cr>", desc = "Neorg Journal Today" },
      { "<leader>nr", "<cmd>Neorg return<cr>", desc = "Neorg Return" },
    },
    config = function()
      -- Expose luarocks-built norg parsers to Neovim treesitter
      for _, name in ipairs({ "norg", "norg_meta" }) do
        local path, err = package.searchpath("parser." .. name, package.cpath)
        if path and not err then
          vim.treesitter.language.add(name, { path = path })
        end
      end

      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/neorg",
              },
              default_workspace = "notes",
            },
          },
          ["core.journal"] = {},
          ["core.summary"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = {},
          ["core.qol.toc"] = {
            config = {
              close_after_use = true,
            },
          },
          ["core.integrations.treesitter"] = {
            config = {
              configure_parsers = false,
            },
          },
        },
      })
    end,
  },
}
