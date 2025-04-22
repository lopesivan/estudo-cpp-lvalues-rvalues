#!/usr/bin/sed -f


h
g
s/^/\n---\n# /
p
i\`\`\`file
x
s/^/path: .\//

/\.cpp$/bis_cpp
/\.md$/bis_markdown

:is_cpp
alang: cpp\n\`\`\`

bis_eof

:is_markdown
alang: markdown\n\`\`\`

:is_eof
