#!/usr/bin/env bash

# 0 - stdin
# 1 - stdout
# 2 - stderr

exec 4>&1 # stdout duplicado ( FD 4 tem as mesmas caracteristicas
# do STDOUT), aponta para o terminal.

exec 1>slide.md # stdout aponta para `out.txt'

#echo Estou escrevendo no arquivo.               # echo "TEXTO" > out.txt
#echo Estou escrevendo no terminal. >&4          # echo "TEXTO"
#echo Estou escrevendo no arquivo novamente.     # echo "TEXTO" > out.txt

cat <<EOF
---
title: Modern C++ Understanding lvalues, rvalues, and std::move
author: Ivan Lopes (lopesivan.ufrj@gmail.com)
date:   2025-04-20
---

Modern C++: Understanding lvalues, rvalues, and std::move 🚀

C++ é uma linguagem incrivelmente poderosa, mas não está livre de suas peculiaridades. Se você já ouviu os termos lvalue e rvalue e achou que soavam confusos, você não está sozinho. Não se preocupe, porque esta postagem vai dividir esses conceitos em partes pequenas e fáceis de entender, junto com exemplos práticos para turbinar suas habilidades em C++ moderno! 💡
EOF

prefix=example_1.

ls ${prefix}*.* |
    sort -n -t\. -k 2 |
    ./f.sed

cat <<EOF
---
# Contato

**lopesivan.ufrj**@gmail.com

/* -*- vim: set ts=4 sw=4 tw=64 ft=markdown: -*- */
EOF

echo PYENV_VERSION=3.6.15 lookatme -e file_loader slide.md >&4

exec 1>&4 # FD 1 recebe as caracteristicas de FD 4.
# FD 1 ressetado.

exec 4>&- # FD 4 eh liberado.

exit 0
