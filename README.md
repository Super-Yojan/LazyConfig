# 💤 LazyConfig


![Configuration Picture](./pictures/ConfigImage.png)

A curated collection of dotfiles and configurations for a productive development environment on macOS (and Linux). Built around **Neovim (LazyVim)**, **Fish shell**, and **Aerospace**.

## 🚀 Quick Start

This repository uses [just](https://github.com/casey/just) to manage configurations.

### 1. Prerequisites

Ensure you have `just` installed:
- **macOS**: `brew install just`
- **Linux**: `sudo apt install just` (or via your package manager)

### 2. Installation

Clone the repository and run the setup:

```bash
git clone https://github.com/yojan/LazyConfig.git
cd LazyConfig
just all
```

*Note: This will symlink the configurations to your `~/.config` directory. It will `rm -rf` existing configs in those paths, so back them up first if needed.*

## 🛠️ Components

| Category | Tool | Description |
| :--- | :--- | :--- |
| **Editor** | [Neovim](https://neovim.io/) | Powered by [LazyVim](https://www.lazyvim.org/) with Rust and Python extras. |
| **Shell** | [Fish](https://fishshell.com/) | Interactive shell with Starship prompt and Zoxide navigation. |
| **Terminal** | [Alacritty](https://alacritty.org/) / [WezTerm](https://wezfurlong.org/wezterm/) | Modern, GPU-accelerated terminal emulators. |
| **Multiplexer** | [Zellij](https://zellij.dev/) / [Tmux](https://github.com/tmux/tmux) | Workspace management with custom sessionizer. |
| **Window Manager** | [Aerospace](https://github.com/nikitabobko/AeroSpace) | i3-like tiling window manager for macOS. |
| **CLI Tools** | `eza`, `bat`, `fzf`, `jj` | Modern replacements for standard Unix tools. |

## 📁 Structure

- `nvim/`: Neovim configuration (LazyVim).
- `fish/`: Shell configuration, aliases, and functions.
- `zellij/`: Layouts and configuration for Zellij.
- `alacritty/` & `wezterm/`: Terminal aesthetics and behavior.
- `.aerospace.toml`: Tiling window management rules.
- `scripts/`: Custom utilities like `tmux-sessionizer`.
- `zed/`: Settings for the Zed editor.

## ⌨️ Key Workflows

- **Terminal Navigation**: Use `z` (zoxide) to jump to directories.
- **Session Management**:
    - **Tmux**: `Ctrl + f` launches the `tmux-sessionizer` to quickly switch between projects.
    - **Zellij**: `Ctrl + w` runs a custom `zjs` command in a floating pane.
- **Editor**: Standard LazyVim keybindings. Custom plugins include `obsidian.nvim`, `quarto-nvim`, and `gitsigns`.
- **Window Management**: Managed via Aerospace (see `.aerospace.toml` for bindings).

## 🎨 Theming

- **General**: Most tools use **Catppuccin Mocha** for a consistent, high-contrast aesthetic.
- **Zellij**: Custom **"Industrial Futurist"** theme (Oxocarbon-based with Red accents).
- **Fish**: Custom `EZA_COLORS` for a clean, semantic directory listing.

## 🤝 Acknowledgments

- [LazyVim](https://github.com/LazyVim/LazyVim) for the incredible Neovim base.
- [Folke](https://github.com/folke) for the amazing plugins.
- [Catppuccin](https://github.com/catppuccin/catppuccin) for the colors.
