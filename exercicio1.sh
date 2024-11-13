#!/bin/bash

# Verifica se o diretório foi fornecido como argumento
if [ -z "$1" ]; then
  echo "Por favor, forneça o caminho de um diretório como argumento."
  exit 1
fi

# Navega até o diretório especificado pelo utilizador
diretorio="$1"
if [ -d "$diretorio" ]; then
  cd "$diretorio" || exit
  echo "Navegando para o diretório: $diretorio"
else
  echo "O diretório especificado não existe."
  exit 1
fi

# Lista todos os ficheiros e diretórios presentes no diretório atual
echo "Conteúdo do diretório $diretorio:"
ls -la

# Cria um subdiretório chamado "backup" se ainda não existir
if [ ! -d "backup" ]; then
  mkdir "backup"
  echo "Subdiretório 'backup' criado."
else
  echo "O subdiretório 'backup' já existe."
fi

# Move todos os ficheiros .txt para o diretório "backup"
echo "Movendo ficheiros .txt para o diretório 'backup'..."
mv *.txt backup/ 2>/dev/null

# Confirmação da operação
echo "Operação concluída. Ficheiros .txt movidos para 'backup' (se existirem)."
