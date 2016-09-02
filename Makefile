#
# This creates symbolic links to all of the right directories
#
# OS specific links should go in their respective make tasks
#

all:
	ln -sf ~/.dotfiles/vimrc ~/.vimrc
	ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
	ln -sf ~/.dotfiles/gitignore_global ~/.gitignore_global
	ln -sf ~/.dotfiles/bash_alias ~/.bash_aliases
	ln -sf ~/.dotfiles/ssh_config ~/.ssh/config
	ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
	mkdir -p ./.git/hooks
	ln -sf ~/.dotfiles/pre-push ./.git/hooks/pre-push
	chmod +x ./.git/hooks/pre-push
	ln -sf ~/.dotfiles/env ~/.env

mac: all
	echo "Hello MacOS!"
	ln -sf ~/.dotfiles/macrc ~/.macrc

ubuntu: all
	echo "Hello Ubuntu!"
	wget -O xt  http://git.io/v3D8e && chmod +x xt && ./xt && rm xt # Install bash theme
