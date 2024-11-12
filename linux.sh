# Atualizar repositórios e pacotes
echo "Atualizando repositórios e pacotes..."
sudo apt update && sudo apt upgrade -y

# Instalar o Git
echo "Instalando o Git..."
sudo apt install -y git

# Configurar o Git com nome e email
echo "Configurando o Git com seu nome e email..."
read -p "Digite seu nome (Git): " git_name
read -p "Digite seu email (Git): " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"

# Gerar uma chave SSH
echo "Gerando chave SSH..."
read -p "Digite seu email para chave SSH: " ssh_email
ssh-keygen -t rsa -b 4096 -C "$ssh_email" -f ~/.ssh/id_rsa -N ""

# Exibir chave pública gerada
echo "Aqui está a sua chave pública SSH:"
cat ~/.ssh/id_rsa.pub

# Finalizar
echo "Configuração concluída!"
echo "Agora, adicione sua chave pública no GitHub ou em outro repositório remoto."

curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
