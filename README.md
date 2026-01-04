# 💤 LazyConfig | The Industrial Futurist

![Configuration Picture](./pictures/ConfigImage.png)

A comprehensive "Operating System" for high-performance engineering. Built on **Neovim**, **Fish**, and **WezTerm**, optimized for robotics research, control theory, and systems programming.

**Philosophy:** Signal-to-Noise Ratio (SNR).
The interface eliminates decoration. It prioritizes data clarity (White) and critical action (Red) against an absolute Void (#161616).

## 🚀 Quick Start

This repository uses [just](https://github.com/casey/just) to manage configurations via symlinks.

### 1. Prerequisites
- **macOS**: `brew install just wezterm fish neovim sioyek tectonic`
- **Linux**: Install via your package manager.

### 2. Installation
Clone the repository and inject the system:

```bash
git clone [https://github.com/yojan/LazyConfig.git](https://github.com/yojan/LazyConfig.git)
cd LazyConfig
just all

```

*Warning: This effectively wipes your existing `~/.config` for the managed tools. Backup your data.*

## 🛠️ The Stack

| Category | Tool | Configuration Strategy |
| --- | --- | --- |
| **Terminal / Mux** | [WezTerm](https://wezfurlong.org/wezterm/) | "Headless" server mode. Replaces Tmux/Zellij entirely. Pure Lua config. |
| **Editor** | [Neovim](https://neovim.io/) | Custom **LazyVim** build. Image rendering via **image.nvim** (Kitty backend). |
| **Shell** | [Fish](https://fishshell.com/) | Strict **eza** coloring (Grey metadata, Red binaries). |
| **PDF / Research** | [Sioyek](https://sioyek.info/) | Custom "Blueprint" mode (Inverted High-Contrast). Vim keybindings. |
| **LaTeX** | [VimTeX](https://github.com/lervag/vimtex) | Automated build pipeline using **Tectonic** (Rust) or **XeLaTeX**. |
| **Browser** | [Zen](https://zen-browser.app/) | Minimalist Firefox fork + **Tridactyl** for vim-navigation. |
| **WM** | [Aerospace](https://github.com/nikitabobko/AeroSpace) | Tiling window manager for macOS (i3-style). |

## ⌨️ Control Systems (Key Bindings)

The system relies on modal layers to manage windows and data.

### 1. Window Management (WezTerm)

*Trigger Leader: `Ctrl + Space*`

| Command | Action |
| --- | --- |
| `Leader` + `\` | Split Horizontal |
| `Leader` + `-` | Split Vertical |
| `Leader` + `h/j/k/l` | Move Focus (Vim Style) |
| `Leader` + `w` | Workspace/Session Manager |
| `Leader` + `$` | Rename Current Session |
| `Leader` + `z` | Toggle Zoom (Fullscreen Pane) |

### 2. Research Workflow (Neovim + Sioyek)

*Trigger Leader: `Space*`

| Command | Action |
| --- | --- |
| `<Leader>l` | **Compile LaTeX** (Continuous Mode) |
| `<Leader>P` | **Preview PDF** (Opens Sioyek) |
| `<Leader>lx` | **Clean Artifacts** (.aux, .log cleanup) |
| `<Leader>p` | **Equation Popup** (Nabla) |
| `i` (in Sioyek) | **Inverse Search** (Jump to code line) |
| `F8` (in Sioyek) | Toggle Color Mode (Blueprint <-> Original) |

## 🎨 Visual Identity: "The Void"

This configuration enforces a strict strict color axiom across all tools:

* **Background:** `#161616` (The Void)
* **Foreground:** `#f2f4f8` (Signal White)
* **Critical/Action:** `#FF0000` (Safety Red)
* **Structure:** `#333333` (Grid/Borders)

### Distinctive Features

* **Eza (ls):** File metadata is pushed to dark grey to reduce visual noise. Executables are highlighted in Red.
* **Sioyek:** Automatically inverts academic papers into the dark "Blueprint" theme for reduced eye strain.
* **WezTerm:** No title bars. No tabs (unless active). The status bar simulates a hardware interface.

## 📁 Repository Structure

```text
├── nvim/             # LazyVim + Custom Plugins (Image, Nabla, VimTeX)
├── fish/             # Shell config & Abbreviated aliases
├── wezterm/          # Lua config for Muxing & Appearance
├── sioyek/           # PDF Viewer prefs & keys
├── aerospace/        # Window Manager rules
├── tridactyl/        # Browser styling & bindings
└── justfile          # Deployment script

```

## 🤝 Acknowledgments

* **LazyVim** for the robust editor foundation.
* **Wez Furlong** for the terminal that made multiplexers obsolete.
* **The Rust Community** for `eza`, `tectonic`, and `bat`.

