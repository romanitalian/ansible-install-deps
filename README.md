# Developer Environment Setup

This Ansible playbook automates the installation of development tools and software for a new computer setup.

## Prerequisites

- Ansible installed on the source computer
- Python 3.x
- SSH access to the target computer (for remote installation)
- For macOS: Xcode Command Line Tools
- For Raspberry Pi: Raspberry Pi OS (64-bit)
- For Ubuntu: Ubuntu 22.04 LTS or newer

## Usage

1. Clone this repository
2. Edit `inventory.ini`:
   - Для локальной установки: оставьте как есть (127.0.0.1)
   - Для удаленной установки: раскомментируйте и укажите IP-адрес целевого компьютера
3. Для удаленной установки настройте SSH:
   ```bash
   # Генерация SSH ключа если его нет
   ssh-keygen -t rsa -b 4096
   
   # Копирование ключа на целевой компьютер
   ssh-copy-id username@192.168.0.74
   ```
4. Используйте Makefile для установки:
   ```bash
   # Проверка установки Ansible
   make check-ansible

   # Проверка SSH соединения (для удаленной установки)
   make check-ssh

   # Локальная установка
   make install-local

   # Удаленная установка
   make install-remote

   # Очистка временных файлов
   make clean
   ```

## Supported Operating Systems

- macOS (Darwin)
- Raspberry Pi OS (64-bit)
- Ubuntu 22.04 LTS or newer

## What will be installed

### Development Tools
- Golang
  - gopls (Go language server)
  - gofumpt (Go formatter)
  - golangci-lint (Go linter)
- PHP 8.x
- Python 3
- Node.js & npm
- Rust
- Protobuf
- SQLite
- Composer (PHP)
- Virtualenv
- Ripgrep
- Tig
- Tree
- wget
- vim
- git
- pre-commit
- yt-dlp

### Terminal Tools
- tmux (terminal multiplexer)
- htop (process viewer)
- ncdu (disk usage analyzer)
- bat (better cat)
- fd (better find)
- exa (better ls)
- fzf (fuzzy finder)
- zsh & oh-my-zsh
- lazygit (git TUI)

### Network Tools
- net-tools
- nmap
- tcpdump
- wireshark
- mtr

### Databases
- MySQL 5.7
- MariaDB
- PostgreSQL 17
- Redis
- ClickHouse

### Database Clients
- mycli (MySQL client)
- pgcli (PostgreSQL client)
- redis-cli
- clickhouse-client

### Message Brokers
- RabbitMQ
- NATS

### System Tools
- btop
- curl
- Docker
- Docker Compose
- Podman
- Buildah
- Skopeo

### IDEs and Editors
- Sublime Text 3
- DBeaver

### Browsers
- Google Chrome

### Communication Tools
- OpenVPN Connect
- Zoom
- Mattermost
- Slack

### Development Tools
- Postman
- kubectl
- Helm
- gRPCurl

### Security Tools
- GPG
- OpenSSL
- Certbot

### Monitoring Tools
- Prometheus
- Grafana
- Telegraf

### Testing Tools
- k6
- Locust
- Vegeta
- wrk

### Documentation Tools
- Asciidoctor
- PlantUML
- Graphviz

### Package Managers
- Homebrew (macOS only)
- apt (Ubuntu/Raspberry Pi) 
