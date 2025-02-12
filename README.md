# DevOps Tools Installer 🛠️

Este repositório contém um script Bash para instalar automaticamente as ferramentas essenciais utilizadas por profissionais de DevOps. O script é compatível com distribuições baseadas em **Debian/Ubuntu**.

## Ferramentas Instaladas

O script instala as seguintes ferramentas:

- **Ferramentas Básicas**: `curl`, `wget`, `git`, `jq`, `unzip`, `build-essential`, `software-properties-common`
- **Docker**: Docker CE, Docker Compose
- **Kubernetes**: `kubectl`
- **CLIs**: AWS CLI, Azure CLI
- **Helm**: Helm, Helmfile
- **Terraform**: Terraform, `terraform-docs`
- **Python**: Python 3, `pip`, `pre-commit`
- **Outras Ferramentas**: Ansible, Vault, Vagrant, Packer, Prometheus, Node.js, npm
- **Monitoramento**: `htop`, `iftop`, `nmon`, `dstat`
- **Rede**: `nmap`, `tcpdump`, `iperf`
- **Desenvolvimento**: `vim`, `tmux`, `zsh`
- **Editor de Código**: Visual Studio Code (VSCode)

## Como Usar

### Pré-requisitos

- Um sistema operacional baseado em **Debian/Ubuntu**.
- Acesso de superusuário (`sudo`).

## Como Usar

### Instalação Automática

Execute o seguinte comando no terminal para instalar todas as ferramentas:
```bash
curl -s https://raw.githubusercontent.com/dgnnj/devops-tools/main/install_devops_tools.sh | bash
```

### Instalação Manual

Clone este repositório:
```bash
git clone https://github.com/dgnnj/devops-tools.git
cd devops-tools
```
Torne o script executável:
```bash
chmod +x install_devops_tools.sh
```

Execute o script:
```bash
./install_devops_tools.sh
```

### Relatório de Instalação
No final da execução, o script exibirá um relatório indicando quais ferramentas foram instaladas com sucesso e quais falharam.