return {

  { "rafamadriz/friendly-snippets" },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      -- will exclude all javascript snippets
      require("luasnip.loaders.from_vscode").load({
        exclude = { "javascript" },
      })

      -- load snippets from path/of/your/nvim/config/my-cool-snippets
      -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
    end,
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  -- require("luasnip.loaders.from_vscode").lazy_load(),
}
