class Produto {
  String nome;
  double preco;

  Produto.comNome(this.nome, this.preco);
}

void produto() {
  Produto produto = Produto.comNome("Camiseta da Isa", 3000.00);

  print("Nome: ${produto.nome}\nPreço: ${produto.preco} \n");
}