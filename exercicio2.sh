#!/bin/bash

# Contar linhas e palavras
wc -l -w backup/teste1.txt

# Mostrar as 5 primeiras linhas
head -n 5 backup/teste1.txt

# Filtra linhas com "erro"
grep -i "erro" backup/teste1.txt


git add exercicio2.sh
git commit -am "Adicionar execicio 2"
git push