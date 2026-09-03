return {
  "lervag/vimtex",
  keys = {
    { "<localLeader>l", false }, -- disable lazyvim's default
    { "<leader>v", "", desc = "+vimtex", ft = "tex" },
  },
  init = function()
    -- Change the prefix to <leader>v (so <leader>vv compiles, <leader>vv views, etc.)
    vim.g.vimtex_mappings_prefix = "<leader>v"

    -- Set the viewer to Sioyek
    -- Other options: "zathura", "sioyek", "mupdf"
    vim.g.vimtex_view_method = "sioyek"

    -- Enable synctex for forward/backward search
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      hooks = {},
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
  end,
}
