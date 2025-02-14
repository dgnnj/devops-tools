#!/bin/bash

# Função para verificar se um comando já está instalado
is_installed() {
    command -v $1 &> /dev/null
}

# Função para verificar se um comando foi instalado corretamente
check_installation() {
    if is_installed $1; then
        echo "[SUCCESS] $1 já está instalado."
    else
        echo "[ERROR] $1 não foi instalado corretamente."
    fi
}

# Atualiza a lista de pacotes
sudo apt-get update

# Instala ferramentas básicas
echo "Instalando ferramentas básicas..."
for tool in curl wget git jq unzip build-essential software-properties-common; do
    if ! is_installed $tool; then
        sudo apt-get install -y $tool
    else
        echo "[SKIP] $tool já está instalado."
    fi
done

# Verifica instalação das ferramentas básicas
for tool in curl wget git jq unzip; do
    check_installation $tool
done

# Instala Docker
if ! is_installed docker; then
    echo "Instalando Docker..."
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
else
    echo "[SKIP] Docker já está instalado."
fi

# Verifica instalação do Docker
check_installation docker

# Instala Docker Compose
if ! is_installed docker-compose; then
    echo "Instalando Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo "[SKIP] Docker Compose já está instalado."
fi

# Verifica instalação do Docker Compose
check_installation docker-compose

# Instala Kubernetes (kubectl)
if ! is_installed kubectl; then
    echo "Instalando kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
else
    echo "[SKIP] kubectl já está instalado."
fi

# Verifica instalação do kubectl
check_installation kubectl

# Instala AWS CLI
if ! is_installed aws; then
    echo "Instalando AWS CLI..."
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
else
    echo "[SKIP] AWS CLI já está instalado."
fi

# Verifica instalação do AWS CLI
check_installation aws

# Instala Azure CLI
if ! is_installed az; then
    echo "Instalando Azure CLI..."
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
else
    echo "[SKIP] Azure CLI já está instalado."
fi

# Verifica instalação do Azure CLI
check_installation az

# Instala Helm
if ! is_installed helm; then
    echo "Instalando Helm..."
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
else
    echo "[SKIP] Helm já está instalado."
fi

# Verifica instalação do Helm
check_installation helm

# Instala Helmfile
if ! is_installed helmfile; then
    echo "Instalando Helmfile..."
    wget https://github.com/roboll/helmfile/releases/download/v0.144.0/helmfile_linux_amd64
    chmod +x helmfile_linux_amd64
    sudo mv helmfile_linux_amd64 /usr/local/bin/helmfile
else
    echo "[SKIP] Helmfile já está instalado."
fi

# Verifica instalação do Helmfile
check_installation helmfile

# Instala Terraform
if ! is_installed terraform; then
    echo "Instalando Terraform..."
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update
    sudo apt-get install -y terraform
else
    echo "[SKIP] Terraform já está instalado."
fi

# Verifica instalação do Terraform
check_installation terraform

# Instala Python e pip
if ! is_installed python3 || ! is_installed pip3; then
    echo "Instalando Python e pip..."
    sudo apt-get install -y python3 python3-pip
else
    echo "[SKIP] Python e pip já estão instalados."
fi

# Verifica instalação do Python e pip
check_installation python3
check_installation pip3

# Instala pipx (necessário para pre-commit)
if ! is_installed pipx; then
    echo "Instalando pipx..."
    sudo apt install -y pipx
    pipx ensurepath
    # Atualiza PATH para a sessão atual
    export PATH="$PATH:$HOME/.local/bin"
else
    echo "[SKIP] pipx já está instalado."
fi

# Instala pre-commit usando pipx
if ! is_installed pre-commit; then
    echo "Instalando pre-commit..."
    pipx install pre-commit
    # Garante que o PATH está atualizado
    export PATH="$PATH:$HOME/.local/bin"
else
    echo "[SKIP] pre-commit já está instalado."
fi

# Verificação adicional para pre-commit
if is_installed pre-commit; then
    echo "[VERSION CHECK] $(pre-commit --version)"
else
    echo "[ERROR] pre-commit não foi encontrado no PATH"
fi

# Instala terraform-docs
if ! is_installed terraform-docs; then
    echo "Instalando terraform-docs..."
    curl -LO https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz
    tar -xzf terraform-docs-v0.16.0-linux-amd64.tar.gz
    sudo mv terraform-docs /usr/local/bin/
else
    echo "[SKIP] terraform-docs já está instalado."
fi

# Verifica instalação do terraform-docs
check_installation terraform-docs

# Instala outras ferramentas úteis
echo "Instalando outras ferramentas úteis..."
for tool in ansible vault vagrant packer prometheus nodejs npm; do
    if ! is_installed $tool; then
        sudo apt-get install -y $tool
    else
        echo "[SKIP] $tool já está instalado."
    fi
done

# Verifica instalação de outras ferramentas
for tool in ansible vault vagrant packer prometheus nodejs npm; do
    check_installation $tool
done

# Instala ferramentas de monitoramento e logging
echo "Instalando ferramentas de monitoramento e logging..."
for tool in htop iftop nmon dstat; do
    if ! is_installed $tool; then
        sudo apt-get install -y $tool
    else
        echo "[SKIP] $tool já está instalado."
    fi
done

# Verifica instalação de ferramentas de monitoramento
for tool in htop iftop nmon dstat; do
    check_installation $tool
done

# Instala ferramentas de rede
echo "Instalando ferramentas de rede..."
for tool in nmap tcpdump iperf; do
    if ! is_installed $tool; then
        sudo apt-get install -y $tool
    else
        echo "[SKIP] $tool já está instalado."
    fi
done

# Verifica instalação de ferramentas de rede
for tool in nmap tcpdump iperf; do
    check_installation $tool
done

# Instala ferramentas de desenvolvimento
echo "Instalando ferramentas de desenvolvimento..."
for tool in vim tmux; do
    if ! is_installed $tool; then
        sudo apt-get install -y $tool
    else
        echo "[SKIP] $tool já está instalado."
    fi
done

# Verifica instalação de ferramentas de desenvolvimento
for tool in vim tmux; do
    check_installation $tool
done

# Instala Visual Studio Code (VSCode) via Snap
if ! is_installed code; then
    echo "Instalando Visual Studio Code..."
    sudo snap install --classic code
else
    echo "[SKIP] Visual Studio Code já está instalado."
fi

# Verifica instalação do VSCode
check_installation code

# Limpa cache de pacotes
sudo apt-get autoremove -y
sudo apt-get clean

# Relatório final
echo ""
echo "=== Relatório de Instalação ==="
echo "Verifique abaixo se todas as ferramentas foram instaladas corretamente:"
for tool in curl wget git jq unzip docker docker-compose kubectl aws az helm helmfile terraform python3 pip3 pre-commit terraform-docs ansible vault vagrant packer prometheus nodejs npm htop iftop nmon dstat nmap tcpdump iperf vim tmux code; do
    check_installation $tool
done

echo ""
echo "Instalação concluída!"
