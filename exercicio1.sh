#!/bin/bash

# Caminho para o diretório
cd Citeforma_Análise_de_Dados

cd "10806 - Linguagens de scripting e linha de comandos"

cd "Aula 4"

cd Ex1---ScriptingCiteforma2004

# Listar
ls

# Criar ficheros .txt
touch teste1.txt teste2.txt

# Criar diretório backup
mkdir backup

# Mover ficheiros para pasta backup 
mv *.txt backup/


git init
git add exercicio1.sh
git commit -m "Adicionar exercício 1"
git remote add https://github.com/Srteixeira1992/Ex1---ScriptingCiteforma2004.git
git push -u origin main