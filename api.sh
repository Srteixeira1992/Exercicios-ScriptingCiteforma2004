#!/bin/bash

# Verifica se o nome da cidade foi fornecido
if [ -z "$1" ]; then
  echo "Por favor, forneça o nome de uma cidade como argumento."
  exit 1
fi

# Define a cidade e a chave da API
cidade="$1"
api_key="202d038326ba8613500e8d4c023d08c0"  # Substitua pela sua chave de API

# Obtem a data e hora atual para o nome do ficheiro
data_atual=$(date +"%Y-%m-%d_%H-%M-%S")
nome_ficheiro="${cidade}_${data_atual}.json"

# Faz a chamada à API para obter o tempo
curl -s "https://api.openweathermap.org/data/2.5/weather?q=${cidade}&appid=${api_key}&units=metric" -o "$nome_ficheiro"

# Verifica se o ficheiro foi criado e contém dados válidos
if [ -s "$nome_ficheiro" ]; then
  echo "Dados do tempo para $cidade guardados em $nome_ficheiro"
else
  echo "Erro ao obter os dados do tempo. Verifique a cidade e a chave da API."
  rm "$nome_ficheiro" 
