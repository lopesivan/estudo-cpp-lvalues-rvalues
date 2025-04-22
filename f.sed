#!/usr/bin/sed -f

# Copia a linha atual para o hold space (backup da linha original)
h

# Recupera a linha do hold space (não faz efeito agora, pois não foi alterada)
g
s/^/\n---\n# /      # Adiciona antes da linha: quebra de linha, '---' e '# ' para título em Markdown
p                   # Imprime a linha modificada (com o título)

# Insere antes da linha a marcação de início de bloco de código
i\
\`\`\`file

# Traz de volta a linha original (que estava no hold space)
x

# Adiciona o prefixo "path: ./" à linha do nome do arquivo
s/^/path: .\//

# Se o arquivo termina com .cpp, vai para o rótulo is_cpp
/\.cpp$/ b is_cpp

# Se o arquivo termina com .md, vai para o rótulo is_markdown
/\.md$/ b is_markdown

# Rótulo para arquivos .cpp
:is_cpp
a\
lang: cpp\
\`\`\`
b is_eof

# Rótulo para arquivos .md
:is_markdown
a\
lang: markdown\
\`\`\`

# Fim do processamento da linha
:is_eof

