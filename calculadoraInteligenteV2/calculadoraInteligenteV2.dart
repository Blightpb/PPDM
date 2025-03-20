import 'dart:io';
import 'exercícios/barrel.dart';

void exibirMenu(){

print('''
    1. Exibir "Olá, Dart!
    2. Calcular a área de um retângulo
    3. Verificar se um número é par ou ímpar
    4. Comparar dois números
    5. Converter nota para conceito
    6. Exibir contagem progressiva
    7. Somar todos os números até um valor especificado
    8. Exibir a tabuada de um número
    9. Sair do programa''');
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
        olaDart();
        break;
      case 2:
        calcularArea();
        break;
      case 3:
        parImpar();
        break;
      case 4:
        comparador();
        break;
      case 5:
        notaConceito();
        break;
      case 6:
        contagemProgressiva();
        break;
      case 7:
        somador();
        break;
      case 8:
        tabuada();
        break;
      case 9:
        ("sair do programa.");
        break;
      default:
        print("Escolha apenas valores entre 1 e 9.");
    }
  } while (escolha != 9);
}
