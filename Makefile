#
# This creates symbolic links to all of the right directories
#
# OS specific links should go in their respective make tasks
#

all:
	ln -sf ~/.dotfiles/vimrc ~/.vimrc
	ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
	ln -sf ~/.dotfiles/gitignore_global ~/.gitignore_global
	ln -sf ~/.dotfiles/bash_alias ~/.bash_alias
	ln -sf ~/.dotfiles/ssh_config ~/.ssh/config

mac: all
	echo "Hello MacOS!"
	ln -sf ~/.dotfiles/macrc ~/.macrc

ubuntu: all
	echo "Hello Ubuntu!"
	wget -O xt  http://git.io/v3D8e && chmod +x xt && ./xt && rm xt # Install bash theme
