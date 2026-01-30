-- Plugin configurations for rocks.nvim
-- This file is loaded after all plugins are loaded via RocksLoaded event

local M = {}

-- Helper to safely require and configure
local function setup(name, config)
  local ok, plugin = pcall(require, name)
  if ok then
    if type(config) == "function" then
      config(plugin)
    elseif type(config) == "table" then
      plugin.setup(config)
    end
  end
end

-- Catppuccin colorscheme
setup("catppuccin", {
  flavour = "mocha",
  transparent_background = false,
  term_colors = true,
  integrations = {
    alpha = true,
    gitsigns = true,
    indent_blankline = { enabled = true },
    mason = true,
    native_lsp = { enabled = true },
    notify = true,
    telescope = true,
    treesitter = true,
    which_key = true,
  },
})
vim.cmd.colorscheme("catppuccin")

-- Lualine (Eviline config)
setup("lualine", function(lualine)
  local colors = {
    bg = '#202328', fg = '#bbc2cf', yellow = '#ECBE7B', cyan = '#008080',
    darkblue = '#081633', green = '#98be65', orange = '#FF8800',
    violet = '#a9a1e1', magenta = '#c678dd', blue = '#51afef', red = '#ec5f67',
  }

  local conditions = {
    buffer_not_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  }

  local config = {
    options = {
      component_separators = "", section_separators = "",
      theme = { normal = { c = { fg = colors.fg, bg = colors.bg } }, inactive = { c = { fg = colors.fg, bg = colors.bg } } },
    },
    sections = { lualine_a = {}, lualine_b = {}, lualine_y = {}, lualine_z = {}, lualine_c = {}, lualine_x = {} },
    inactive_sections = { lualine_a = {}, lualine_b = {}, lualine_y = {}, lualine_z = {}, lualine_c = {}, lualine_x = {} },
  }

  local function ins_left(component) table.insert(config.sections.lualine_c, component) end
  local function ins_right(component) table.insert(config.sections.lualine_x, component) end

  ins_left({ function() return "▊" end, color = { fg = colors.blue }, padding = { left = 0, right = 1 } })
  ins_left({ function() return "" end, color = function()
    local mode_color = { n = colors.red, i = colors.green, v = colors.blue, V = colors.blue, c = colors.magenta, R = colors.violet }
    return { fg = mode_color[vim.fn.mode()] or colors.red }
  end, padding = { right = 1 } })
  ins_left({ "filesize", cond = conditions.buffer_not_empty })
  ins_left({ "filename", cond = conditions.buffer_not_empty, color = { fg = colors.magenta, gui = "bold" } })
  ins_left({ "location" })
  ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })
  ins_left({ "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = " ", warn = " ", info = " " } })
  ins_left({ function() return "%=" end })
  ins_left({ function()
    local clients = vim.lsp.get_clients()
    local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
    for _, client in ipairs(clients) do
      if client.config.filetypes and vim.fn.index(client.config.filetypes, buf_ft) ~= -1 then return client.name end
    end
    return "No LSP"
  end, icon = " LSP:", color = { fg = "#ffffff", gui = "bold" } })
  ins_right({ "o:encoding", fmt = string.upper, cond = conditions.hide_in_width, color = { fg = colors.green, gui = "bold" } })
  ins_right({ "fileformat", fmt = string.upper, icons_enabled = false, color = { fg = colors.green, gui = "bold" } })
  ins_right({ "branch", icon = "", color = { fg = colors.violet, gui = "bold" } })
  ins_right({ "diff", symbols = { added = " ", modified = "󰝤 ", removed = " " }, cond = conditions.hide_in_width })
  ins_right({ function() return "▊" end, color = { fg = colors.blue }, padding = { left = 1 } })

  lualine.setup(config)
end)

-- Which-key
setup("which-key", {
  plugins = { spelling = true },
  spec = {
    { "<leader>b", group = "buffer" }, { "<leader>c", group = "code" },
    { "<leader>f", group = "file/find" }, { "<leader>g", group = "git" },
    { "<leader>h", group = "hunk" }, { "<leader>l", group = "latex" },
    { "<leader>o", group = "obsidian" }, { "<leader>q", group = "quarto" },
    { "<leader>r", group = "rust" }, { "<leader>s", group = "search" },
    { "<leader>t", group = "toggle" }, { "<leader>w", group = "window/write" },
    { "<leader>x", group = "diagnostics" }, { "<leader>F", group = "Flutter" },
  },
})

-- Treesitter (new API - nvim-treesitter.configs no longer exists)
local ts_ok, ts = pcall(require, "nvim-treesitter")
if ts_ok then
  -- Auto-install parsers when entering a buffer
  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      pcall(function() vim.treesitter.start() end)
    end,
  })
  -- Install common parsers
  local parsers = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }
  for _, parser in ipairs(parsers) do
    pcall(function()
      local install = require("nvim-treesitter.install")
      if not vim.tbl_contains(install.installed_parsers(), parser) then
        install.install(parser)
      end
    end)
  end
end

-- Autopairs
setup("nvim-autopairs", { check_ts = true })

-- Comment
setup("Comment", {})

-- Surround
setup("nvim-surround", {})

-- Flash
setup("flash", {})

-- Oil
setup("oil", { default_file_explorer = true, view_options = { show_hidden = true } })

-- Gitsigns
setup("gitsigns", {
  signs = { add = { text = "▎" }, change = { text = "▎" }, delete = { text = "" } },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = function(mode, l, r, opts) opts = opts or {} opts.buffer = bufnr vim.keymap.set(mode, l, r, opts) end
    map("n", "]h", gs.next_hunk, { desc = "Next hunk" })
    map("n", "[h", gs.prev_hunk, { desc = "Previous hunk" })
    map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
    map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
    map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
  end,
})

-- Telescope
setup("telescope", function(telescope)
  telescope.setup({
    defaults = {
      prompt_prefix = "   ", selection_caret = " ",
      file_ignore_patterns = { "node_modules", ".git/", "target/" },
    },
    extensions = {
      fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
      bibtex = { global_files = { "~/Academy/Research/Zotero/library.bib" }, context = true },
    },
  })
  pcall(telescope.load_extension, "fzf")
  pcall(telescope.load_extension, "bibtex")
end)

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>bc", "<cmd>Telescope bibtex<CR>", { desc = "Citations" })

-- Mason & LSP
setup("mason", { ui = { border = "rounded" } })
setup("mason-lspconfig", { ensure_installed = { "lua_ls", "ts_ls", "pyright", "html", "cssls" }, automatic_installation = true })

-- LSP setup
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if lspconfig_ok then
  local capabilities = cmp_lsp_ok and cmp_lsp.default_capabilities() or {}
  local on_attach = function(_, bufnr)
    local map = function(keys, func, desc) vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc }) end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gr", vim.lsp.buf.references, "Go to references")
    map("K", vim.lsp.buf.hover, "Hover")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>cr", vim.lsp.buf.rename, "Rename")
  end

  local servers = { "lua_ls", "ts_ls", "pyright", "html", "cssls", "jsonls", "yamlls" }
  for _, server in ipairs(servers) do
    pcall(function() lspconfig[server].setup({ capabilities = capabilities, on_attach = on_attach }) end)
  end
end

-- Blink completion
setup("blink.cmp", {
  keymap = { preset = "default" },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  completion = { menu = { border = "rounded" }, documentation = { auto_show = true } },
})

-- Trouble
setup("trouble", {})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })

-- Todo-comments
setup("todo-comments", {})

-- Indent blankline
setup("ibl", { indent = { char = "│" }, scope = { enabled = true } })

-- Notify
setup("notify", { timeout = 3000, render = "compact" })
vim.notify = require("notify")

-- Conform (formatting)
setup("conform", {
  formatters_by_ft = {
    lua = { "stylua" }, python = { "black" },
    javascript = { "prettierd", "prettier" }, typescript = { "prettierd", "prettier" },
  },
})

-- Flutter tools
setup("flutter-tools", {
  ui = { border = "rounded" },
  widget_guides = { enabled = true },
  closing_tags = { enabled = true },
})
vim.keymap.set("n", "<leader>Fs", "<cmd>FlutterRun<CR>", { desc = "Flutter run" })
vim.keymap.set("n", "<leader>Fr", "<cmd>FlutterReload<CR>", { desc = "Flutter reload" })
vim.keymap.set("n", "<leader>FR", "<cmd>FlutterRestart<CR>", { desc = "Flutter restart" })

-- VimTeX
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_view_method = "sioyek"
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "View PDF" })

-- Obsidian
setup("obsidian", {
  workspaces = { { name = "personal", path = "~/Obsidian-Vault/" } },
  completion = { nvim_cmp = false },
})
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "New note" })
vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Find note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search notes" })

-- Render markdown
setup("render-markdown", { file_types = { "markdown" } })

-- Supermaven (AI)
setup("supermaven-nvim", {
  keymaps = { accept_suggestion = "<Tab>", clear_suggestion = "<C-]>" },
})

return M
