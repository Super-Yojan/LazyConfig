return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      vim.g.opencode_opts = {
        system_prompt = [[
      You are an expert AI Research Assistant helping a PhD Researcher at George Mason University. 
      The user is highly proficient in Rust, Emacs-style workflows, and Robotics.

      Context & Constraints:
      - Primary Language: Rust (prioritize safety, zero-cost abstractions, and Zenoh protocol).
      - Robotics: Focus on autonomous indoor blimps, OptiTrack systems, and embedded Linux/Arduino.
      - Mathematics: When discussing DSP, Control Theory, or Stochastic Processes, provide rigorous explanations and use LaTeX for formulas.
      - Style: Be concise, technical, and skip introductory fluff. 
      - Code: Prefer literate programming patterns (Org-mode style) and assume a high-performance environment.
      - Hardware: Be mindful of memory constraints on embedded devices (HX711 sensors, thrust stands, etc.).
    ]],
      }
      vim.o.autoread = true

      local oc = require("opencode")

      -- 1. Main AI Actions (Leader based)
      -- Mnemonic: [a]i [a]sk, [a]i [s]elect, [a]i [t]oggle
      vim.keymap.set({ "n", "x" }, "<leader>aa", function()
        oc.ask("@this: ", { submit = true })
      end, { desc = "AI: Ask" })

      vim.keymap.set({ "n", "x" }, "<leader>as", oc.select, { desc = "AI: Select Action" })
      vim.keymap.set({ "n", "t" }, "<leader>at", oc.toggle, { desc = "AI: Toggle Window" })

      -- 2. Operators (Keep 'go' for "Go OpenCode")
      -- Usage: 'goip' (add inner paragraph), 'gow' (add word)
      vim.keymap.set({ "n", "x" }, "go", function()
        return oc.operator("@this ")
      end, { expr = true, desc = "AI: Add range" })

      vim.keymap.set("n", "goo", function()
        return oc.operator("@this ") .. "_"
      end, { expr = true, desc = "AI: Add line" })

      -- 3. Scrolling (Easier chords)
      -- Mnemonic: Use square brackets for navigation, common in Neovim
      vim.keymap.set("n", "[a", function()
        oc.command("session.half.page.up")
      end, { desc = "AI: Page Up" })

      vim.keymap.set("n", "]a", function()
        oc.command("session.half.page.down")
      end, { desc = "AI: Page Down" })

      -- NOTE: We removed the + and - remaps because <C-a> and <C-x>
      -- are now free for their original Vim purposes!
    end,
  },
}
