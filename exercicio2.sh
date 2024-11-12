#!/bin/bash

# Contar linhas e palavras
wc -l -w backup/teste1.txt
10 10 backup/teste1.txt

# Mostrar as 5 primeiras linhas
head -n 5 backup/teste1.txt
a1
a2a
a3
a4a
a5

# Filtra linhas com "erro"
grep -i "erro" backup/teste1.txt

git add exercicio2.sh
