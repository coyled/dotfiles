#
# vim: noexpandtab
# ^^^ remember: tabs not spaces here
#

OS     := $(shell uname -s | tr '[:upper:]' '[:lower:]' | sed 's/^darwin$$/macos/')
GROUPS := $(wildcard common $(OS))
TARGET := $(HOME)
DEPS   := stow git

rbenv_repo = https://github.com/rbenv/rbenv.git
rbenv_dir = ${HOME}/.rbenv
rubybuild_dir = ${rbenv_dir}/plugins/ruby-build
origin_dir = ${PWD}

#install: check link rbenv
install: check link
	@echo "done!"

check:
	@echo "veifying dependencies..."
	@for dep in $(DEPS); do \
		if ! command -v $$dep; then \
			echo "$$dep required but not found"; \
			exit 1; \
		fi; \
	done

	@echo "stow dry run..."
	stow -n -v -t $(TARGET) $(GROUPS)

link:
	@echo "symlinking $(GROUPS)..."
	ln -sf /dev/null $(TARGET)/.bash_history
	stow --no-folding -t $(TARGET) $(GROUPS)

rbenv:
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

.PHONY: install
