.PHONY: all help test ansible_bash ansible_zsh ansible_gitpod
all: help

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

RUN := docker run -v ${PWD}/..:/home/user/.dotfiles -v ${PWD}:/test --rm
TERM := $(RUN) --interactive --tty

test:
	$(MAKE) ansible_bash
	$(MAKE) ansible_zsh
	$(MAKE) ansible_gitpod

build:
	# docker build --target ${TARGET} -t dotfile-test:${TARGET} .
	cd .. && docker build -f test/Dockerfile --target ${TARGET} -t dotfile-test:${TARGET} .

ubuntu_bash_build:
	TARGET=bash $(MAKE) build

ubuntu_zsh_build:
	TARGET=zsh $(MAKE) build

gitpod_bash_build:
	TARGET=gitpod-bash $(MAKE) build

# TARGET=codespace $(MAKE) build
codespace_build:
	docker build --platform linux/amd64 --target codespace -t dotfile-test:codespace .

ubuntu_bash_shell_test: ubuntu_bash_build ## test SHELL install on UBUNTU-BASH
	$(RUN) dotfile-test:bash /test/shell_install.sh

ubuntu_bash_shell_term: ubuntu_bash_build ## open a shell in UBUNTU-BASH after a shell install
	$(TERM) --entrypoint=/test/shell_install.sh dotfile-test:bash bash

ubuntu_bash_ansible_test: ubuntu_bash_build ## test ANSIBLE install on UBUNTU-BASH
	$(RUN) dotfile-test:bash /test/ansible_install.sh

ubuntu_bash_ansible_term: ubuntu_bash_build ## open a shell in UBUNTU-BASH after an ansible install
	$(TERM) --entrypoint=/test/ansible_install.sh dotfile-test:bash bash

ubuntu_bash_term: ubuntu_bash_build ## open a shell in UBUNTU-BASH
	$(TERM) dotfile-test:bash bash

ubuntu_zsh_shell_test: ubuntu_zsh_build ## test SHELL install on UBUNTU-ZSH
	$(RUN) dotfile-test:zsh /test/shell_install.sh

ubuntu_zsh_ansible_test: ubuntu_zsh_build ## test ANSIBLE install on UBUNTU-ZSH
	$(RUN) dotfile-test:zsh /test/ansible_install.sh

ubuntu_zsh_ansible_term: ## open a shell in UBUNTU-ZSH after an ansible install
	TARGET=zsh-ansible $(MAKE) build
	$(TERM) dotfile-test:zsh-ansible zsh

gitpod_bash_ansible_test: gitpod_bash_build ## test ANSIBLE install on GITPOD
	$(RUN) dotfile-test:gitpod-bash /test/ansible_install.sh

cde_bash_ansible_test: codespace_build ## test SHELL install on Codespaces
	$(RUN) dotfile-test:codespace /test/ansible_install.sh
