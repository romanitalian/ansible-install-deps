SHELL:=bash

.DEFAULT_GOAL := help

##@ Help
help: ## Show this help message
	@clear
	@echo "Available commands:"
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[0;33m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@echo "" 
	
##@ Development
check-ansible: ## Check if Ansible is installed
	@which ansible >/dev/null 2>&1 || (echo "Error: Ansible is not installed" && exit 1)
	@echo "Ansible is installed: $$(ansible --version | head -n1)"

check-ssh: ## Check SSH connection to remote host
	@if grep -q "^[0-9]" inventory.ini; then \
		IP=$$(grep "^[0-9]" inventory.ini | cut -d' ' -f1); \
		USER=$$(grep "^[0-9]" inventory.ini | cut -d' ' -f2 | cut -d'=' -f2); \
		echo "Checking SSH connection to $$USER@$$IP..."; \
		ssh -o BatchMode=yes -o ConnectTimeout=5 $$USER@$$IP echo "SSH connection successful" || (echo "Error: SSH connection failed" && exit 1); \
	else \
		echo "No remote host configured in inventory.ini"; \
	fi

##@ Installation
install-local: ## Install on local machine (127.0.0.1)
	@echo "Installing on local machine..."
	ansible-playbook -i inventory.ini main.yml

install-remote: check-ssh ## Install on remote machine (requires IP in inventory.ini)
	@echo "Installing on remote machine..."
	ansible-playbook -i inventory.ini main.yml

##@ Maintenance
clean: ## Clean temporary files
	@echo "Cleaning temporary files..."
	@find . -type f -name "*.retry" -delete
	@find . -type f -name "*.pyc" -delete
	@find . -type d -name "__pycache__" -delete
	@echo "Clean complete"
