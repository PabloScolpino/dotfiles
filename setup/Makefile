.PHONY: all help setup
all: help

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

ansible_lint: ## Lint ansible playbooks
	ansible-playbook main.yml --syntax-check

setup_ansible_dependencies: ## Install ansible dependencies
	ansible-galaxy install -r requirements.yml

gh_setup_ansible:
ifeq ($(shell uname -s),Darwin)
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install ansible
else
	sudo apt-get update
	sudo apt-get install -y --no-install-recommends python3-setuptools python3-pip python3-wheel
	sudo pip3 install ansible
endif

ansible_install: setup_ansible_dependencies ## Install ansible roles and run playbooks
	ansible-playbook main.yml -i inventory
