.PHONY: all help setup
all: help

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

lint: ## Lint ansible playbooks
	ansible-playbook main.yml --syntax-check

setup_dependencies: ## Install ansible dependencies
	ansible-galaxy install -r requirements.yml

gh_setup_ansible_linux:
	sudo apt-get install -y --no-install-recommends python3-setuptools python3-pip python3-wheel
	sudo pip3 install ansible

install: setup_dependencies ## Install ansible roles and run playbooks
	ansible-playbook main.yml -i inventory
