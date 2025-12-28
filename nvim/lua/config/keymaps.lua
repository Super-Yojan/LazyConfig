-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set

map("n", "<leader>[", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>]", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Tmux Down" })
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<leader>-", "<cmd>Oil --float<cr>", { desc = "Tmux Right" })

-- set shorter name for keymap function
local kmap = vim.keymap.set

-- F5 processes the document once, and refreshes the view
kmap({ "n", "v", "i" }, "<F5>", function()
  require("knap").process_once()
end)

-- F6 closes the viewer application, and allows settings to be reset
kmap({ "n", "v", "i" }, "<F6>", function()
  require("knap").close_viewer()
end)

-- F7 toggles the auto-processing on and off
kmap({ "n", "v", "i" }, "<F7>", function()
  require("knap").toggle_autopreviewing()
end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap({ "n", "v", "i" }, "<F8>", function()
  require("knap").forward_jump()
end)

vim.keymap.set("n", "<leader>qp", ":QuartoPreview<CR>", { desc = "Quarto Preview (Live Browser)" })
vim.keymap.set("n", "<leader>qr", function()
  -- This mimics the Org-mode "Ctrl-c Ctrl-c" to run a block
  require("quarto").run_cell()
end, { desc = "Quarto Run Cell" })

-- Custom PhD Project Scaffolder
vim.keymap.set("n", "<leader>rp", function()
  local name = vim.fn.input("Experiment Name: ")
  if name == "" then
    return
  end

  local dir = vim.fn.getcwd() .. "/" .. name
  vim.fn.mkdir(dir .. "/data", "p")
  vim.fn.mkdir(dir .. "/scripts", "p")

  local template = {
    "---",
    "title: 'GMU Research: " .. name .. "'",
    "format: html",
    "---",
    "",
    "## Theory (Control/DSP)",
    "$$ H(s) = \\dots $$",
    "",
    "## Implementation (Rust)",
    "```{rust}",
    "// Robotics logic here",
    "```",
  }

  vim.fn.writefile(template, dir .. "/notes.qmd")
  vim.cmd("edit " .. dir .. "/notes.qmd")
end, { desc = "Research: New Experiment" })
