#!/bin/bash

# Verifica se o nome da cidade foi fornecido como argumento
if [ -z "$1" ]; then
  read -p "Por favor, forneça o nome de uma cidade: " cidade
else
  cidade="$1"
fi

# Define a chave da API
api_key="202d038326ba8613500e8d4c023d08c0"

# Obtém a data e hora atual para o nome do ficheiro
data_atual=$(date +"%Y-%m-%d_%H-%M-%S")
nome_ficheiro="${cidade}_${data_atual}.json"

# Faz a chamada à API para obter os dados do tempo
curl -s "https://api.openweathermap.org/data/2.5/weather?q=${cidade}&appid=${api_key}&units=metric" -o "$nome_ficheiro"

# Verifica se o ficheiro foi criado e contém dados válidos
if [ -s "$nome_ficheiro" ]; then
  echo "Dados do tempo para $cidade guardados em $nome_ficheiro"
else
  echo "Erro ao obter os dados do tempo. Verifique a cidade e a chave da API."
  rm -f "$nome_ficheiro"
  exit 1
fi

# Função para obter a previsão do tempo rápida (wttr.in)
get_weather() {
    curl -s "https://wttr.in/?format=3"
}

# Solicitar ou validar o diretório para organização de ficheiros
read -p "Insira o caminho do diretório para organizar os ficheiros: " dir

# Verificar se o diretório existe, caso contrário, criar
if [ ! -d "$dir" ]; then
    echo "Diretório não encontrado. Criando $dir..."
    mkdir -p "$dir"
fi

# Criar subdiretórios para organização
small_dir="$dir/pequenos"
medium_dir="$dir/medios"
large_dir="$dir/grandes"
mkdir -p "$small_dir" "$medium_dir" "$large_dir"

# Organizar ficheiros por tamanho, ignorando .sh
for file in "$dir"/*; do
    if [ -f "$file" ] && [[ "$file" != *.sh ]]; then
        size=$(stat -c%s "$file")
        if [ "$size" -lt 10000 ]; then
            mv "$file" "$small_dir/"
        elif [ "$size" -lt 1000000 ]; then
            mv "$file" "$medium_dir/"
        else
            mv "$file" "$large_dir/"
        fi
    fi
done

# Criar backup do diretório
backup_dir="$dir/backup_$(date +%Y-%m-%d)"
mkdir -p "$backup_dir"
cp -r "$small_dir" "$medium_dir" "$large_dir" "$backup_dir"

# Gerar relatório
total_files=$(find "$dir" -type f ! -name "*.sh" | wc -l)
largest_file=$(find "$dir" -type f ! -name "*.sh" -exec ls -lh {} + | sort -k 5 -h | tail -1)
average_size=$(find "$dir" -type f ! -name "*.sh" -exec stat -c%s {} + | awk '{ total += $1; count++ } END { if (count > 0) print total/count; else print 0 }')

relatorio="$dir/relatorio.txt"
{
    echo "Relatório do Diretório - $(date)"
    echo "-----------------------------------"
    echo "Número total de ficheiros (excluindo .sh): $total_files"
    echo "Nome do maior ficheiro: $(basename "$(echo "$largest_file" | awk '{print $9}')")"
    echo "Tamanho do maior ficheiro: $(echo "$largest_file" | awk '{print $5}')"
    echo "Tamanho médio dos ficheiros: $average_size bytes"
    echo "Previsão do tempo atual: $(get_weather)"
} > "$relatorio"

echo "Script concluído. Relatório gerado em $relatorio."
