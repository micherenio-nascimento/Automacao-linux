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

# Start Crome
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Start vscode

# Definir o nome do arquivo .deb
FILE_NAME="code_1.95.2-1730981514_amd64.deb"

# Baixar o arquivo .deb do Visual Studio Code
echo "Baixando o Visual Studio Code..."
curl -O https://update.code.visualstudio.com/1.95.2/linux-deb-x64/stable

# Verificar se o arquivo foi baixado com sucesso
if [[ ! -f "$FILE_NAME" ]]; then
  echo "Erro ao baixar o arquivo. Verifique o link ou sua conexão."
  exit 1
fi

# Instalar o pacote .deb usando dpkg
echo "Instalando o Visual Studio Code..."
sudo dpkg -i $FILE_NAME

# Corrigir dependências, se necessário
echo "Verificando e corrigindo dependências..."
sudo apt-get install -f -y

# Limpar o arquivo .deb após a instalação
echo "Limpeza dos arquivos temporários..."
rm $FILE_NAME

echo "Instalação concluída! O Visual Studio Code foi instalado com sucesso."


