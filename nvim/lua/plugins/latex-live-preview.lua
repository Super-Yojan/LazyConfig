return {
  -- 1. Typst Preview (Unchanged)
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {},
  },

  -- 2. VimTeX (Sioyek + XeLaTeX)
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- VIEWER: Sioyek
      vim.g.vimtex_view_method = "sioyek"

      -- COMPILER: Use latexmk
      vim.g.vimtex_compiler_method = "latexmk"

      -- ENGINE: Force XeLaTeX (Required for fontspec/Monaspace fonts)
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-xelatex",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- CLEANLINESS: Extensions to remove with :VimtexClean
      vim.g.vimtex_clean_enabled = 1
      vim.g.vimtex_clean_additional_extensions = {
        "aux",
        "log",
        "out",
        "toc",
        "fls",
        "fdb_latexmk",
        "synctex.gz",
        "xdv",
      }

      -- UI Settings
      vim.g.vimtex_quickfix_mode = 0
    end,
    keys = {
      -- MAPPINGS
      -- <leader>l : Compile (Continuous Mode)
      -- <leader>P : Preview (Open Sioyek)
      -- <leader>lx: Clean aux files
      { "<leader>l", "<cmd>VimtexCompile<cr>", desc = "VimTeX: Compile" },
      { "<leader>lp", "<cmd>VimtexView<cr>", desc = "VimTeX: Preview PDF" },
      { "<leader>lx", "<cmd>VimtexClean<cr>", desc = "VimTeX: Clean Aux Files" },
    },
  },

  -- 3. Nabla (Unchanged)
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
      require("nabla").enable_virt({ autogen = true, silent = true })
    end,
  },

  -- 4. Treesitter (Unchanged)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "latex", "markdown", "markdown_inline", "typst" },
      highlight = { enable = true },
    },
  },
}
