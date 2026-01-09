return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },

  -- 1. Keybinds (Global)
  keys = {
    { "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "New Note" },
    { "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find Note (File)" },
    { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "Search Note Content" },
    { "<leader>nl", "<cmd>ObsidianLink<cr>", desc = "Link Selection", mode = "v" },
    { "<leader>no", "<cmd>ObsidianFollowLink<cr>", desc = "Open/Create Link" },
  },

  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Obsidian-Vault/",
      },
    },

    -- 2. THE FIX: Disable nvim-cmp to stop the crash
    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },

    -- 3. Mappings (Buffer-local, inside notes only)
    mappings = {
      -- Fix 'gd' to follow links instead of looking for code definitions
      ["gd"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle checkboxes with Enter
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },

    note_id_func = function(title)
      return title
    end,
  },
}
