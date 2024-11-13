echo "Digite o nome do ficheiro para guardar a lista de processos:"
read filename

# Verifica se o nome do ficheiro está vazio
if [[ -z "$filename" ]]; then
    echo "Erro: O nome do ficheiro não pode estar vazio."
    exit 1
fi

# Lista os processos e guarda no ficheiro especificado
tasklist > "$filename"

# Verifica se houve erro ao executar o comando
if [[ $? -ne 0 ]]; then
    echo "Erro: Ocorreu um problema ao listar os processos."
else
    echo "A lista de processos foi guardada em '$filename'."
fi
