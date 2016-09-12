rbenv_repo = git://github.com/sstephenson/rbenv.git
rbenv_dir = ${HOME}/.rbenv

FILES := .aumixrc .ratpoisonrc .vimrc .xinitrc .zshenv .bash_history \
	 .gitconfig .screenrc .Xdefaults .zsh .zshrc

install:
	@echo "rm'ing old files..."
	$(foreach FILE, $(FILES), $(shell rm ~/$(FILE)))

	@echo "symlinking files..."
	$(foreach FILE, $(FILES), $(shell ln -s $(PWD)/$(FILE) ~/$(FILE)))

	@echo "installing rbenv..."
	@if [ ! -d ${rbenv_dir} ]; then \
		git clone ${rbenv_repo} ${rbenv_dir} ; \
	fi

	@echo "done!"

.PHONY: install
