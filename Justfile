# Justfile for LazyConfig

# Helper to create necessary directories
dirs:
    mkdir -p ~/.config
    mkdir -p ~/.local/bin

# Link Neovim config
nvim: dirs
    rm -rf ~/.config/nvim
    ln -s {{ justfile_directory() }}/nvim ~/.config/nvim

# Link Alacritty config
alacritty: dirs
    rm -rf ~/.config/alacritty
    ln -s {{ justfile_directory() }}/alacritty ~/.config/alacritty

# Link Fish config
fish: dirs
    rm -rf ~/.config/fish
    ln -s {{ justfile_directory() }}/fish ~/.config/fish

# Link Starship config
starship: dirs
    rm -f ~/.config/starship.toml
    ln -s {{ justfile_directory() }}/starship.toml ~/.config/starship.toml

# Link Zellij config
zellij: dirs
    rm -rf ~/.config/zellij
    ln -s {{ justfile_directory() }}/zellij ~/.config/zellij

# Link Wezterm config
wezterm: dirs
    rm -rf ~/.config/wezterm
    ln -s {{ justfile_directory() }}/wezterm ~/.config/wezterm

# Link Aerospace config
aerospace:
    rm -f ~/.aerospace.toml
    ln -s {{ justfile_directory() }}/.aerospace.toml ~/.aerospace.toml

# Link Tmux config
tmux:
    rm -f ~/.tmux.conf
    ln -s {{ justfile_directory() }}/.tmux.conf ~/.tmux.conf

# Link Eza config
eza: dirs
    rm -rf ~/.config/eza
    ln -s {{ justfile_directory() }}/eza ~/.config/eza

# Link Fastfetch config
fastfetch: dirs
    rm -rf ~/.config/fastfetch
    ln -s {{ justfile_directory() }}/fastfetch ~/.config/fastfetch

# Link Jujutsu (jj) config
jj: dirs
    rm -rf ~/.config/jj
    ln -s {{ justfile_directory() }}/jj ~/.config/jj

# Link Manim config
manim: dirs
    rm -rf ~/.config/manim
    ln -s {{ justfile_directory() }}/manim ~/.config/manim

# Link MPV config
mpv: dirs
    rm -rf ~/.config/mpv
    ln -s {{ justfile_directory() }}/mpv ~/.config/mpv

# Link Sioyek config
sioyek: dirs
    rm -rf ~/.config/sioyek
    ln -s {{ justfile_directory() }}/sioyek ~/.config/sioyek

# Link Zed config
zed: dirs
    rm -rf ~/.config/zed
    ln -s {{ justfile_directory() }}/zed ~/.config/zed

# Link Opencode config
opencode: dirs
    rm -rf ~/.config/opencode
    ln -s {{ justfile_directory() }}/opencode ~/.config/opencode

# Link UV config
uv: dirs
    rm -rf ~/.config/uv
    ln -s {{ justfile_directory() }}/uv ~/.config/uv

# Link Scripts
scripts: dirs
    ln -sf {{ justfile_directory() }}/scripts/tmux-sessionizer ~/.local/bin/tmux-sessionizer

# Install Ubuntu dependencies
deps-ubuntu:
    sudo apt install fzf fish -y
    git clone git@github.com:githubnext/monaspace.git
    cd monaspace && bash util/install_linux.sh
    rm -rf monaspace

# Install Mac dependencies
deps-mac:
    # TODO ADD check for brew
    brew install fzf fish zellij font-fira-code-nerd-font eza

# Setup all configurations
all: nvim alacritty fish starship zellij wezterm aerospace tmux eza fastfetch jj manim mpv sioyek zed opencode uv scripts
