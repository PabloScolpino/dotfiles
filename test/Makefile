.PHONY: all help test ansible_bash ansible_zsh ansible_gitpod
all: help

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

test:
	$(MAKE) ansible_bash
	$(MAKE) ansible_zsh
	$(MAKE) ansible_gitpod

build:
	docker build --target ${TARGET} -t dotfile-test:${TARGET} .

build_ubuntu_bash:
	TARGET=bash $(MAKE) build

build_ubuntu_zsh:
	TARGET=zsh $(MAKE) build

build_gitpod_bash:
	TARGET=gitpod-bash $(MAKE) build

# TARGET=codespace $(MAKE) build
build_codespace:
	docker build --platform linux/amd64 --target codespace -t codespace .

test_ubuntu_bash_shell: build_ubuntu_bash ## test SHELL install on UBUNTU-BASH
	docker run -v ${PWD}:/test --rm dotfile-test:bash /test/shell_install.sh

# test_ubuntu_bash_ansible: build_ubuntu_bash ## test ANSIBLE install on UBUNTU-BASH
test_ubuntu_bash_ansible: ## test ANSIBLE install on UBUNTU-BASH
	docker run -v ${PWD}/..:/home/user/.dotfiles -v ${PWD}:/test --rm dotfile-test:bash /test/ansible_install.sh

ubuntu_bash: ## open a shell in UBUNTU-BASH
	docker run -v ${PWD}/..:/home/user/.dotfiles -v ${PWD}:/test --rm --interactive --tty dotfile-test:bash bash

test_ubuntu_zsh_shell: build_ubuntu_zsh ## test SHELL install on UBUNTU-ZSH
	docker run -v ${PWD}:/test --rm dotfile-test:zsh /test/shell_install.sh

test_ubuntu_zsh_ansible: build_ubuntu_zsh ## test ANSIBLE install on UBUNTU-ZSH
	docker run -v ${PWD}/..:/home/user/.dotfiles -v ${PWD}:/test --rm dotfile-test:zsh /test/ansible_install.sh

test_bash_gitpod_ansible: build_gitpod_bash ## test ANSIBLE install on GITPOD
	docker run -v ${PWD}/..:/home/gitpod/.dotfiles -v ${PWD}:/test --rm dotfile-test:gitpod-bash /test/ansible_install.sh

test_cde_bash_ansible: build_codespace ## test SHELL install on Codespaces
	docker run -v ${PWD}/..:/home/gitpod/.dotfiles -v ${PWD}:/test --rm dotfile-test:codespace /test/ansible_install.sh

# Build with platform specified

# Run the container
# docker run --platform linux/amd64 -it my-devcontainer bash

