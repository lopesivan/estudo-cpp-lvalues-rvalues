---
title: Lambda expression in modern C++
author: Ivan Lopes (lopesivan.ufrj@gmail.com)
date:   2021-11-22
extensions:
  - image_ueberzug
  - render
---

# O início

```cpp

//
// main
//
int main() {

    return 0; // success return
}
```

---

# Olá Mundo

```cpp
#include <iostream>

//
// main
//
int main() {

    std::cout << "Hello, World!" << std::endl;

    return 0; // success return
}
```

---

# Usando **vector**

Criando um vetor de inteiros

```cpp
#include <iostream>
#include <vector>

//
// main
//
int main() {

    std::vector <int> v {1,2,3,4,5,6};

    return 0; // success return
}
```

---

# Usando **vector**

Imprimindo na tela o vetor

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

//
// main
//
int main() {

    std::vector <int> v {1,2,3,4,5,6};
    std::for_each(v.begin(), v.end(), something);

    return 0; // success return
}
```

algo deu errado **something** ainda não foi definido

---

# Definindo something

Imprimindo na tela o vetor

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {

    struct
    {
        void operator()(int i)
        {
            std::cout << i << std::endl;
        }
    }something;

    std::vector <int> v {1,2,3,4,5,6};
    std::for_each(v.begin(), v.end(), something);

    return 0; // success return
}
```

---

# \[cc\](p){fd};

```text
[cc](p){fd};
 ^^  ^  ^^
 |   |  |
 |   |  +-- function definition
 |   +-- parameters
 +--- caption close
```

---

# \[cc\](p){fd};

```cpp
struct
{
    void operator()(int i)
    {
        std::cout << i << std::endl;
    }
}something;
```

```cpp
[](int i){std::cout << i << std::endl;}
```

---

# CQD

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {

    std::vector <int> v {1,2,3,4,5,6};
    std::for_each(v.begin(), v.end(), [] (int i) { std::cout << i << std::endl; });

    return 0; // success return
}
```

---

# Mais uma: Par ou ímpar

```cpp
[](int i){
    if(i%2==0)
        std::cout << i << "é um número par" << std::endl;
    else
        std::cout << i << "é um número ímpar" << std::endl;
}
```

---

# Mais uma: Par ou ímpar

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {

    std::vector <int> v {1,2,3,4,5,6};
    std::for_each(v.begin(), v.end(), [](int i){
        if(i%2==0)
            std::cout << i << " é um número par" << std::endl;
        else
            std::cout << i << " é um número ímpar" << std::endl;
    });

    return 0; // success return
}
```
---

# Caption Close

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

int main() {

    int n = 3;
    std::vector <int> v {1,2,3,4,5,6};
    std::for_each(v.begin(), v.end(), [n](int i){
        if(i%n==0)
            std::cout << i << " é idivisível por "<< n << std::endl;
        else
            std::cout << i << " não é idivisível por "<< n << std::endl;
    });

    return 0; // success return
}
```

---

# Caption Close \[n\]

n entra no escopo, mas não pode ser setado.

```cpp
int n = 3;
std::vector <int> v {1,2,3,4,5,6};
std::for_each(v.begin(), v.end(), [n](int i){
    if(i%n==0)
        std::cout << i << " é idivisível por "<< n << std::endl;
    else
        std::cout << i << " não é idivisível por "<< n << std::endl;

    n = 9;
    std::cout <<"=> "<< n << std::endl;
});
```

---

# Caption Close \[&n\]

n entra no escopo pelo adress, e pode ser setado.

```cpp
int n = 3;
std::vector <int> v {1,2,3,4,5,6};
std::for_each(v.begin(), v.end(), [&n](int i){
    if(i%n==0)
        std::cout << i << " é idivisível por "<< n << std::endl;
    else
        std::cout << i << " não é idivisível por "<< n << std::endl;

    n = 9;
    std::cout <<"=> "<< n << std::endl;
});
```

---

# Caption Close \[&n,e\]

n entra no escopo pelo adress, pode ser setado e a variável "e"
não pode ser setada.

```cpp
int n = 3, e = 5;
std::vector <int> v {1,2,3,4,5,6};
std::for_each(v.begin(), v.end(), [&n,e](int i){
    if(i%n==0)
        std::cout << i << " é idivisível por "<< n << std::endl;
    else
        std::cout << i << " não é idivisível por "<< n << std::endl;

    n = 9;
    std::cout <<"n = "<< n << std::endl;
    std::cout <<"e = "<< e << std::endl;
});
```

---

# Caption Close \[&n,e\]

n entra no escopo pelo adress, pode ser setado e a variável "e"
não pode ser setada.

```cpp
int n = 3, e = 5;
std::vector <int> v {1,2,3,4,5,6};
std::for_each(v.begin(), v.end(), [&n,e](int i){
    if(i%n==0)
        std::cout << i << " é idivisível por "<< n << std::endl;
    else
        std::cout << i << " não é idivisível por "<< n << std::endl;

    n = 9;
    e = 6;
    std::cout <<"n = "<< n << std::endl;
    std::cout <<"e = "<< e << std::endl;
});
```

---

# Caption Close \[&\]

"n" e "e" entra no escopo pelo adress, e pode ser setado.

```cpp
int n = 3, e = 5;
std::vector <int> v {1,2,3,4,5,6};
std::for_each(v.begin(), v.end(), [&](int i){
    if(i%n==0)
        std::cout << i << " é idivisível por "<< n << std::endl;
    else
        std::cout << i << " não é idivisível por "<< n << std::endl;

    n = 9;
    e = 4;
    std::cout <<"n = "<< n << std::endl;
    std::cout <<"e = "<< e << std::endl;
});
```

---

# Caption Close \[=\]

"n" e "e" entra no escopo, e não pode ser setado.

```cpp
int n = 3, e = 5;
std::vector <int> v {1,2,3,4,5,6};
std::for_each(v.begin(), v.end(), [=](int i){
    if(i%n==0)
        std::cout << i << " é idivisível por "<< n << std::endl;
    else
        std::cout << i << " não é idivisível por "<< n << std::endl;

    // n = 9;
    // e = 4;
    std::cout <<"n = "<< n << std::endl;
    std::cout <<"e = "<< e << std::endl;
});
```

---

# Contato

**ivanlopes**@id.uff.br

/* -*- vim: set ts=4 sw=4 tw=64 ft=markdown: -*- */
