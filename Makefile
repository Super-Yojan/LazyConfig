nvim:
	ln -s  $(shell pwd)/nvim ~/.config/nvim 
tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s $(shell pwd)/.tmux.conf ~/.tmux.conf
	mkdir -p ~/.local/bin/
	ln -s $(shell pwd)/scripts/tmux-sessionizer ~/.local/bin/tmux-sessionizer
bashrc:
	echo "alias vim=nvim" >> ~/.bashrc

alacrity:
	mkdir -p ~/.config/alacritty/
	ln -s $(shell pwd)/alacritty.toml ~/.config/alacritty/

deps-ubuntu:
	# Ubuntu
	sudo apt install fzf -y
	git clone git@github.com:githubnext/monaspace.git
	(cd monaspace && bash util/install_linux.sh)
	rm -rf monaspace


