return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "quarto" },
    },
    --dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ft = { "markdown", "quarto" },

    latex = {
      enabled = true,
      -- 'latex2text' is the most compatible default
      converter = "latex2text",
      highlight = "RenderMarkdownMath",
    },
    -- This section is crucial for non-standard markdown blocks
    injections = {
      quarto = {
        enabled = true,
        -- This tells the plugin to look for LaTeX environments
        query = [[
                (latex_block) @injection.content
            ]],
      },
    },
  },
}
