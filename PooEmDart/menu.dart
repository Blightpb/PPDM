import 'dart:io';
import 'exercícios/barrel.dart';

void exibirMenu(){

print('''
    1. Classe simples: produto.
    2. Classe com encapsulamento: contaBancária 
    3. Validação com encapsulamento: Funcionario
    4. Classe simples + lista: Aluno''');
}
    
void main() {
  int escolha;

  do {
    exibirMenu();
    stdout.write("\n Escolha uma opção: ");
    escolha = int.parse(stdin.readLineSync()!);

    print("");

    switch (escolha) {
      case 1:
        produto();
        break;
      case 2:
        contaBancaria();
        break;
      case 3:
        salario();
        break;
      case 4:
        aluno();
        break;
      default:
        print("Escolha apenas valores entre 1 e 4.");
    }
  } while (escolha != 4);
}
