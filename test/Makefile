.PHONY: all help test ansible_bash ansible_zsh ansible_gitpod
all: help

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

test:
	$(MAKE) ansible_bash
	$(MAKE) ansible_zsh
	$(MAKE) ansible_gitpod

build_ubuntu_bash:
	docker build --target bash -t dotfile-test:bash .

build_ubuntu_zsh:
	docker build --target zsh -t dotfile-test:zsh .

build_gitpod_bash:
	docker build --target gitpod-bash -t dotfile-test:gitpod-bash .

ubuntu_bash_shell: build_ubuntu_bash ## test SHELL install on UBUNTU-BASH
	docker run -v ${PWD}:/test --rm dotfile-test:bash /test/shell_install.sh

ubuntu_bash_ansible: build_ubuntu_bash ## test ANSIBLE install on UBUNTU-BASH
	docker run -v ${PWD}/..:/home/user/.dotfiles -v ${PWD}:/test --rm dotfile-test:bash /test/ansible_install.sh

ubuntu_bash_sh: build_ubuntu_bash ## open a shell in a UBUNTU-BASH env
	docker run -it -v ${PWD}/..:/home/user/.dotfiles -v ${PWD}:/test --rm dotfile-test:bash bash

ubuntu_zsh_shell: build_ubuntu_zsh ## test SHELL install on UBUNTU-ZSH
	docker run -v ${PWD}:/test --rm dotfile-test:zsh /test/shell_install.sh

ubuntu_zsh_ansible: build_ubuntu_zsh ## test ANSIBLE install on UBUNTU-ZSH
	docker run -v ${PWD}/..:/home/user/.dotfiles -v ${PWD}:/test --rm dotfile-test:zsh /test/ansible_install.sh

bash_gitpod_ansible: build_gitpod_bash ## test SHELL install on GITPOD
	docker run -v ${PWD}/..:/home/gitpod/.dotfiles -v ${PWD}:/test --rm dotfile-test:gitpod-bash /test/ansible_install.sh
