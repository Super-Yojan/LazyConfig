return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    -- 1. PALETTE: Oxocarbon + Industrial Red Override
    local colors = {
      -- Base
      bg = "#1C1C1E", -- Off-Black (unchanged)
      fg = "#D4C5B0", -- Muted Cream (Dr. Moscovium foreground)

      -- Primary accents
      blue = "#4A5F7F", -- Muted Blue (keywords, primary)
      cyan = "#5A7A7A", -- Muted Teal (functions, secondary)
      red = "#B85450", -- Muted Red (errors, warnings)

      -- Supporting colors
      yellow = "#C17A5F", -- Rust Orange (numbers, constants)
      orange = "#C17A5F", -- Same as yellow for consistency
      green = "#6B7456", -- Olive Green (strings, success)
      violet = "#7A6B7F", -- Dusty Purple (preprocessor, special)
      magenta = "#7A6B7F", -- Same as violet

      -- Specific use cases
      darkblue = "#4A5F7F", -- Same as blue for consistency

      -- Neutrals (for completeness)
      gray = "#8E8E93", -- Light Gray (comments, disabled)
      dark_gray = "#2A2A2C", -- Dark Gray (backgrounds)
      med_gray = "#454547", -- Medium Gray (borders)
    }
    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config table
    local config = {
      options = {
        -- Remove default separators for a clean "Schematic" look
        component_separators = "",
        section_separators = "",
        theme = {
          -- We define a custom theme that matches the background exactly
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Helper functions to insert components
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- --- LEFT SIDE COMPONENTS ---

    -- 1. The "Power Pillar" (Visual Anchor)
    ins_left({
      function()
        return "▊"
      end,
      color = { fg = colors.red }, -- Brand Red Anchor
      padding = { left = 0, right = 1 },
    })

    -- 2. Mode Indicator (Color Coded)
    ins_left({
      function()
        return ""
      end,
      color = function()
        -- Auto-change color based on mode
        local mode_color = {
          n = colors.blue, -- Normal: Standard Blue
          i = colors.red, -- Insert: BRAND RED (Active Writing)
          v = colors.magenta, -- Visual: Purple
          [""] = colors.magenta,
          V = colors.magenta,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [""] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { right = 1 },
    })

    ins_left({ "filesize", cond = conditions.buffer_not_empty })
    ins_left({ "filename", cond = conditions.buffer_not_empty, color = { fg = colors.fg, gui = "bold" } })
    ins_left({ "location" })
    ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

    -- Diagnostics (Red/Yellow/Cyan)
    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.cyan },
      },
    })

    -- Middle Spacer
    ins_left({
      function()
        return "%="
      end,
    })

    -- LSP Status
    ins_left({
      function()
        local msg = "NO LSP"
        local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = " ",
      color = { fg = colors.fg, gui = "bold" },
    })

    -- --- RIGHT SIDE COMPONENTS ---

    ins_right({
      "o:encoding",
      fmt = string.upper,
      cond = conditions.hide_in_width,
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({
      "fileformat",
      fmt = string.upper,
      icons_enabled = false,
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({ "branch", icon = "", color = { fg = colors.violet, gui = "bold" } })

    -- Git Diff (Red/Green/Orange)
    ins_right({
      "diff",
      symbols = { added = " ", modified = "󰝤 ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.blue },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    -- Right Anchor
    ins_right({
      function()
        return "▊"
      end,
      color = { fg = colors.red }, -- Brand Red Anchor
      padding = { left = 1 },
    })

    return config
  end,
}
