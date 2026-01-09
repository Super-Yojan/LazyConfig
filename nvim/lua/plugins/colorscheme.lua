return {
  "super-yojan/moscovium.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("moscovium").setup({
      transparent = false,
      italic_comments = true,
      bold_keywords = true,
    })
    vim.opt.termguicolors = true
    vim.cmd("colorscheme moscovium")
  end,
}
