-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Treesitter main no longer auto-starts highlights; enable for .norg
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "norg" },
  callback = function()
    vim.wo.conceallevel = 2
    vim.wo.concealcursor = "nc"
    vim.wo.foldlevel = 99
    if pcall(vim.treesitter.start) then
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end

    -- Remap keys that conflict with LazyVim / blink.cmp defaults
    vim.keymap.set(
      "n",
      "<LocalLeader>tt",
      "<Plug>(neorg.qol.todo-items.todo.task-cycle)",
      { buffer = true, desc = "[neorg] Cycle Task" }
    )
    vim.keymap.set("n", "<LocalLeader>o", "<cmd>Neorg toc<CR>", { buffer = true, desc = "[neorg] Table of Contents" })
  end,
})
