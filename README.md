# DevOps Tools Installer 🛠️

This repository contains a Bash script to automatically install essential tools used by DevOps professionals. The script is compatible with **Debian/Ubuntu**-based distributions.

## Installed Tools

The script installs the following tools:

- **Basic Tools**: `curl`, `wget`, `git`, `jq`, `unzip`, `build-essential`, `software-properties-common`
- **Docker**: Docker CE, Docker Compose
- **Kubernetes**: `kubectl`
- **CLIs**: AWS CLI, Azure CLI
- **Helm**: Helm, Helmfile
- **Terraform**: Terraform, `terraform-docs`
- **Python**: Python 3, `pip`, `pre-commit`
- **Other Tools**: Ansible, Vault, Vagrant, Packer, Prometheus, Node.js, npm
- **Monitoring**: `htop`, `iftop`, `nmon`, `dstat`
- **Networking**: `nmap`, `tcpdump`, `iperf`
- **Development**: `vim`, `tmux`
- **Code Editor**: Visual Studio Code (VSCode)

## How to Use

### Prerequisites

- A **Debian/Ubuntu**-based operating system.
- Superuser access (`sudo`).

## How to Use

### Automatic Installation

Run the following command in the terminal to install all tools:
```bash
curl -s https://raw.githubusercontent.com/dgnnj/devops-tools/main/install_devops_tools.sh | bash
```

### Manual Installation

Clone this repository:
```bash
git clone https://github.com/dgnnj/devops-tools.git
cd devops-tools
```
Make the script executable:
```bash
chmod +x install_devops_tools.sh
```

Run the script:
```bash
./install_devops_tools.sh
```

### Installation Report
At the end of the execution, the script will display a report indicating which tools were installed successfully and which failed.
