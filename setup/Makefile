.PHONY: all help setup
all: help

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

ansible_lint: ## Lint ansible playbooks
	ansible-playbook main.yml --syntax-check

setup_ansible_dependencies: ## Install ansible dependencies
	ansible-galaxy install -r requirements.yml

ansible_install: setup_ansible_dependencies ## Install ansible roles and run playbooks
	ansible-playbook main.yml -i inventory
