return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Minimalist Header: Clean identity for Yojan
      dashboard.section.header.val = {
        [[  __     ______      _          _   ]],
        [[  \ \   / / __ \    | |   /\   | \  ]],
        [[   \ \_/ / |  | |   | |  /  \  |  \ ]],
        [[    \   /| |  | |_  | | / /\ \ | . \]],
        [[     | | | |__| | |_| |/ ____ \| |\ ]],
        [[     |_|  \____/ \___//_/    \_\_| \]],
        [[                                    ]],
        [[            YOJAN | 2026            ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "󰈞  FIND FILE", ":Telescope find_files<CR>"),
        dashboard.button("r", "󰄉  RECENT", ":Telescope oldfiles<CR>"),
        dashboard.button("s", "󰚰  SESSION", ":SessionManager load_last_session<CR>"),
        dashboard.button("q", "󰅚  QUIT", ":qa<CR>"),
      }

      dashboard.section.footer.val = "󰄬  WELCOME BACK, YOJAN | SYSTEM READY"
      dashboard.section.footer.opts.hl = "Comment"

      alpha.setup(dashboard.opts)
    end,
  },
}
