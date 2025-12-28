return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter", -- Ensures it only loads when you open Neovim without a file
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Header: Custom ASCII for Dr. Moscovium
      dashboard.section.header.val = {
        [[      _____        __  __                             _               ]],
        [[     |  __ \      |  \/  |                           (_)              ]],
        [[     | |  | |_ __ | \  / | ___  ___  ___ _____   __ _ _ _   _ _ __ __ ]],
        [[     | |  | | '__|| |\/| |/ _ \/ __|/ __/ _ \ \ / /| | | | | | '_ ` _ \]],
        [[     | |__| | |   | |  | | (_) \__ \ (_| (_) \ V / | | |_| | | | | | |]],
        [[     |_____/|_|   |_|  |_|\___/|___/\___\___/ \_/  |_|\__,_|_| |_| |_|]],
        [[                                                                      ]],
        [[                RESEARCH | ROBOTICS | CONTROL | MUSIC                 ]],
      }

      -- Buttons: Tailored to your PhD and Dev workflow
      dashboard.section.buttons.val = {
        dashboard.button("t", "󰑖  TQE PREPARATION", ":Telescope find_files cwd=~/Documents/PhD/TQE<CR>"),
        dashboard.button("r", "󱠔  BLIMP RESEARCH PAPER", ":Telescope find_files cwd=~/Documents/PhD/Research<CR>"),
        dashboard.button("y", "󰗃  YOUTUBE: ROBOTIC ARM", ":Telescope find_files cwd=~/Projects/Youtube<CR>"),
        dashboard.button("z", "󱗼  ZENOH RUST FRAMEWORK", ":Telescope find_files cwd=~/Projects/Rust/robo<CR>"),
        dashboard.button("s", "󰚰  RESTORE SESSION", ":SessionManager load_last_session<CR>"),
        dashboard.button("q", "󰅚  QUIT", ":qa<CR>"),
      }

      -- Dynamic TQE Countdown Footer
      local function get_tqe_countdown()
        -- TQE Date: January 13, 2026
        local tqe_date = os.time({ year = 2026, month = 1, day = 13 })
        local diff = os.difftime(tqe_date, os.time())
        local days_left = math.floor(diff / (24 * 60 * 60))

        if days_left > 0 then
          return "󱫐  " .. days_left .. " DAYS UNTIL TQE (JAN 13) | STAY FOCUSED YOJAN"
        elseif days_left == 0 then
          return "󰗑  TODAY IS THE TQE! GOOD LUCK DR. MOSCOVIUM!"
        else
          return "󰄬  TQE COMPLETED | BACK TO RESEARCH"
        end
      end

      dashboard.section.footer.val = get_tqe_countdown()
      dashboard.section.footer.opts.hl = "WarningMsg" -- Highlight to catch your eye

      alpha.setup(dashboard.opts)
    end,
  },
}
