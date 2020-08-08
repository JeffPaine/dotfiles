.PHONY: all

all:
	[ -f ${HOME}/.bash_profile ] || ln -s $(PWD)/bash_profile ${HOME}/.bash_profile
	[ -f ${HOME}/.bashrc ] || ln -s $(PWD)/bashrc ${HOME}/.bashrc
	[ -f ${HOME}/.conkyrc ] || ln -s $(PWD)/conkyrc ${HOME}/.conkyrc
	[ -f ${HOME}/.gitconfig ] || ln -s $(PWD)/gitconfig ${HOME}/.gitconfig
	[ -f ${HOME}/.gitignore_global ] || ln -s $(PWD)/gitignore_global ${HOME}/.gitignore_global
	[ -f ${HOME}/.inputrc ] || ln -s $(PWD)/inputrc ${HOME}/.inputrc
	# [ -f ${HOME}/.psqlrc ] || ln -s $(PWD)/psqlrc ${HOME}/.psqlrc
	[ -f ${HOME}/.tmux.conf ] || ln -s $(PWD)/tmux.conf ${HOME}/.tmux.conf
	[ -f ${HOME}/.vimrc ] || ln -s $(PWD)/vimrc ${HOME}/.vimrc
