#!/bin/bash

# Verifica se o ficheiro foi fornecido como argumento
if [ -z "$1" ]; then
  echo "Por favor, forneça o caminho de um ficheiro como argumento."
  exit 1
fi

# Verifica se o ficheiro especificado existe
ficheiro="$1"
if [ ! -f "$ficheiro" ]; then
  echo "O ficheiro especificado não existe."
  exit 1
fi

# Contar o número de linhas e palavras do ficheiro
num_linhas=$(wc -l < "$ficheiro")
num_palavras=$(wc -w < "$ficheiro")
echo "O ficheiro '$ficheiro' contém $num_linhas linhas e $num_palavras palavras."

# Mostrar apenas as primeiras 5 linhas do ficheiro
echo "As primeiras 5 linhas do ficheiro são:"
head -n 5 "$ficheiro"

# Filtrar e mostrar todas as linhas que contenham a palavra "erro" (case insensitive)
echo "Linhas que contêm a palavra 'erro' (independente de maiúsculas/minúsculas):"
grep -i "erro" "$ficheiro"
