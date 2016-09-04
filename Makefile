FILES := .aumixrc .ratpoisonrc .vimrc .xinitrc .zshenv .bash_history \
	 .gitconfig .screenrc .Xdefaults .zsh .zshrc

install:
	$(foreach FILE, $(FILES), $(shell ln -s $(PWD)/$(FILE) ~/$(FILE)))

.PHONY: install
