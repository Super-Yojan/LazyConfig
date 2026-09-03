-- Follow the macOS system appearance (System Settings > Appearance).
--
-- macOS exposes the current appearance through `defaults read -g AppleInterfaceStyle`,
-- which prints "Dark" in dark mode and fails with a non-zero exit in light mode.
-- There is no notification we can subscribe to from Neovim, so we poll cheaply in
-- the background and also re-check whenever the window regains focus.

local M = {}

M.schemes = {
  dark = "github_dark_default",
  light = "github_light_default",
}

-- How often to re-check the system appearance, in milliseconds.
M.interval = 3000

local is_macos = vim.fn.has("mac") == 1
local timer = nil

---@param out string
---@param code integer
---@return "dark"|"light"
local function parse(out, code)
  return (code == 0 and out:find("Dark", 1, true)) and "dark" or "light"
end

---@param mode "dark"|"light"
local function apply(mode)
  local scheme = M.schemes[mode]
  if vim.g.colors_name == scheme and vim.o.background == mode then
    return
  end
  vim.o.background = mode
  local ok, err = pcall(vim.cmd.colorscheme, scheme)
  if not ok then
    vim.notify(("theme: failed to load %s: %s"):format(scheme, err), vim.log.levels.WARN)
  end
end

--- Check the system appearance and apply the matching colorscheme.
---@param sync boolean? block until the appearance is known (used at startup)
function M.sync(sync)
  if not is_macos then
    -- Elsewhere, trust whatever the terminal reported via OSC 11.
    apply(vim.o.background == "light" and "light" or "dark")
    return
  end

  local cmd = { "defaults", "read", "-g", "AppleInterfaceStyle" }

  if sync then
    apply(parse(vim.fn.system(cmd), vim.v.shell_error))
    return
  end

  vim.system(cmd, { text = true }, function(res)
    local mode = parse(res.stdout or "", res.code)
    vim.schedule(function()
      apply(mode)
    end)
  end)
end

function M.setup()
  M.sync(true)

  vim.api.nvim_create_autocmd({ "FocusGained", "VimResume" }, {
    group = vim.api.nvim_create_augroup("system_theme", { clear = true }),
    desc = "Re-check the system appearance",
    callback = function()
      M.sync()
    end,
  })

  if is_macos and not timer then
    timer = vim.uv.new_timer()
    timer:start(M.interval, M.interval, function()
      M.sync()
    end)
  end

  vim.api.nvim_create_user_command("ThemeSync", function()
    M.sync(true)
  end, { desc = "Re-apply the colorscheme for the current system appearance" })
end

return M
