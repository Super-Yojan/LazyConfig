.PHONY: all nvim alacritty fish starship zellij wezterm aerospace tmux eza fastfetch jj manim mpv sioyek zed opencode uv scripts

all: nvim alacritty fish starship zellij wezterm aerospace tmux eza fastfetch jj manim mpv sioyek zed opencode uv scripts

# Helper to create necessary directories
dirs:
	mkdir -p ~/.config
	mkdir -p ~/.local/bin

nvim: dirs
	rm -rf ~/.config/nvim
	ln -s $(shell pwd)/nvim ~/.config/nvim

alacritty: dirs
	rm -rf ~/.config/alacritty
	ln -s $(shell pwd)/alacritty ~/.config/alacritty

fish: dirs
	rm -rf ~/.config/fish
	ln -s $(shell pwd)/fish ~/.config/fish

starship: dirs
	rm -f ~/.config/starship.toml
	ln -s $(shell pwd)/starship.toml ~/.config/starship.toml

zellij: dirs
	rm -rf ~/.config/zellij
	ln -s $(shell pwd)/zellij ~/.config/zellij
	# Note: sync-zellij.sh and zjs scripts were missing from root, removed from target

wezterm: dirs
	rm -rf ~/.config/wezterm
	ln -s $(shell pwd)/wezterm ~/.config/wezterm

aerospace:
	rm -f ~/.aerospace.toml
	ln -s $(shell pwd)/.aerospace.toml ~/.aerospace.toml

tmux:
	rm -f ~/.tmux.conf
	ln -s $(shell pwd)/.tmux.conf ~/.tmux.conf

eza: dirs
	rm -rf ~/.config/eza
	ln -s $(shell pwd)/eza ~/.config/eza

fastfetch: dirs
	rm -rf ~/.config/fastfetch
	ln -s $(shell pwd)/fastfetch ~/.config/fastfetch

jj: dirs
	rm -rf ~/.config/jj
	ln -s $(shell pwd)/jj ~/.config/jj

manim: dirs
	rm -rf ~/.config/manim
	ln -s $(shell pwd)/manim ~/.config/manim

mpv: dirs
	rm -rf ~/.config/mpv
	ln -s $(shell pwd)/mpv ~/.config/mpv

sioyek: dirs
	rm -rf ~/.config/sioyek
	ln -s $(shell pwd)/sioyek ~/.config/sioyek

zed: dirs
	rm -rf ~/.config/zed
	ln -s $(shell pwd)/zed ~/.config/zed

opencode: dirs
	rm -rf ~/.config/opencode
	ln -s $(shell pwd)/opencode ~/.config/opencode

uv: dirs
	rm -rf ~/.config/uv
	ln -s $(shell pwd)/uv ~/.config/uv

scripts: dirs
	ln -sf $(shell pwd)/scripts/tmux-sessionizer ~/.local/bin/tmux-sessionizer

deps-ubuntu:
	# Ubuntu
	sudo apt install fzf fish -y
	git clone git@github.com:githubnext/monaspace.git
	(cd monaspace && bash util/install_linux.sh)
	rm -rf monaspace

deps-mac:
	# TODO ADD check for brew
	brew install fzf fish zellij font-fira-code-nerd-font eza



