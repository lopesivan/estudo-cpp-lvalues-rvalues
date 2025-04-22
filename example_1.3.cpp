// Exemplo de referências lvalue e rvalue:

int x = 42;

// Referência lvalue
int& lref = x; // OK: referência lvalue para x

// Referência rvalue
int&& rref = 42; // OK: referência rvalue para um temporário (42)

// Erro: não é possível associar uma referência lvalue a um rvalue
// int& invalid = 42;
