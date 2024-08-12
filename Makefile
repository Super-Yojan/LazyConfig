nvim:
	ln -s  $(shell pwd)/nvim ~/.config/nvim 
tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s $(shell pwd)/.tmux.conf ~/.tmux.conf
	mkdir -p ~/.local/bin/
	ln -s $(shell pwd)/scripts/tmux-sessionizer ~/.local/bin/tmux-sessionizer
bashrc:
	echo "alias vim=nvim" >> ~/.bashrc

deps:
	# Ubuntu
	sudo apt install fzf -y


