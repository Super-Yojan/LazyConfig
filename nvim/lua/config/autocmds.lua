-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "quarto", "markdown" },
  callback = function()
    local otter = require("otter")
    -- This "activates" the LSP for the languages you use in your PhD research
    otter.activate({ "rust", "python", "lua" }, true, true, nil)
  end,
})
