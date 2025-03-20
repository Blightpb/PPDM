import 'dart:io'; // biblioteca para entrada e saída de dados

void parImpar() {
  print("Digite um número inteiro: ");
  int numero = int.parse(stdin.readLineSync()!);

  if (numero % 2 == 0) {
    print("O número $numero é par.");
  } else {
    print("o número $numero é ímpar");
  }
}
