rbenv_repo = git://github.com/sstephenson/rbenv.git
rbenv_dir = ${HOME}/.rbenv
rubybuild_dir = ${rbenv_dir}/plugins/ruby-build
origin_dir = ${PWD}

FILES := .aumixrc .ratpoisonrc .vimrc .xinitrc .zshenv .bash_history \
	 .gitconfig .screenrc .vim .Xdefaults .zsh .zsh-git-prompt .zshrc

install:
	@echo "rm'ing old files..."
	$(foreach FILE, $(FILES), $(shell rm ~/$(FILE)))

	@echo "symlinking files..."
	$(foreach FILE, $(FILES), $(shell ln -s $(PWD)/$(FILE) ~/$(FILE)))

	@echo "installing or updating rbenv..."
	@if [ -d ${rbenv_dir} ]; then \
		cd ${rbenv_dir} && git fetch origin && git rtu && cd ${origin_dir} ; \
	else \
		git clone ${rbenv_repo} ${rbenv_dir} ; \
	fi

	@echo "installing or updating ruby-build plugin for rbenv..."
	@if [ -d ${rubybuild_dir} ]; then \
		cd ${rubybuild_dir} && git fetch origin && git rtu && cd ${origin_dir} ; \
	else \
		git clone https://github.com/rbenv/ruby-build.git ${rubybuild_dir} ; \
	fi

	@echo "done!"

.PHONY: install
