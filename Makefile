nvim:
	ln -s  $(shell pwd)/nvim ~/.config/nvim 

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s $(shell pwd)/.tmux.conf ~/.tmux.conf
	mkdir -p ~/.local/bin/
	ln -s $(shell pwd)/scripts/tmux-sessionizer ~/.local/bin/tmux-sessionizer

# TODO Update this to fish config
bashrc:
	echo "alias vim=nvim" >> ~/.bashrc

alacrity:
	rm -rf ~/.config/alacritty/
	ln -s $(shell pwd)/alacritty ~/.config/alacritty

fish:
	rm -rf ~/.config/fish
	ln -s $(shell pwd)/fish ~/.config/fish

deps-ubuntu:
	# Ubuntu
	sudo apt install fzf fish -y
	git clone git@github.com:githubnext/monaspace.git
	(cd monaspace && bash util/install_linux.sh)
	rm -rf monaspace

deps-mac:
	# TODO ADD check for brew
	brew install fzf fish zellij font-fira-code-nerd-font

.PHONY: fish nvim

