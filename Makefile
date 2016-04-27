#
# This creates symbolic links to all of the right directories
#
# OS specific links should go in their respective make tasks
#

all:
	ln -sf ~/.dotfiles/.vimrc ~/.config/nvim/init.vim
	ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
	ln -sf ~/.dotfiles/.gitignore_global ~/.gitignore_global
	ln -sf ~/.dotfiles/.bash_alias ~/.bash_alias

mac: all
	echo "Hello MacOS!"
	ln -sf ~/.dotfiles/.macrc ~/.macrc

ubuntu: all
	echo "Hello Ubuntu!"
