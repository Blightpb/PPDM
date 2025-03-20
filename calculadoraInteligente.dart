import 'dart:io';

void main() {
  while (true) {
    print("\n Calculadora inteligente \n");
    print('1. Exibir "Olá, Dart!"');
    print("2. Calcular a área de um retângulo");
    print("3. Verificar se um número é par ou ímpar");
    print("4. Comparar dois números");
    print("5. Converter nota para conceito");
    print("6. Exibir contagem progressiva");
    print("7. Somar todos os números até um valor especificado");
    print("8. Exibir a tabuada de um número");
    print("9. Sair do programa \n");
    print("Escolha uma opção: \n");

    int escolha = int.parse(stdin.readLineSync()!);

    switch (escolha) {

      case 1:
        print('Olá, Dart!');
        break;

      case 2:
        print("Insira a base do retângulo: ");
        int baseRetangulo = int.parse(stdin.readLineSync()!);

        print("Insira a altura do retângulo: ");
        int alturaRetangulo = int.parse(stdin.readLineSync()!);

        int area = baseRetangulo * alturaRetangulo;

        print("O cálculo da área do retângulo é de $area.");
        break;

      case 3:
        print("Digite um número inteiro: ");
        int numero = int.parse(stdin.readLineSync()!);

        if (numero % 2 == 0) {
          print("O número $numero é par.");
        } else {
          print("o número $numero é ímpar");
        }
        break;

      case 4:
        print("Insira um número: ");
        int numero1 = int.parse(stdin.readLineSync()!);
        print("Insira outro número: ");
        int numero2 = int.parse(stdin.readLineSync()!);

        if (numero1 > numero2) {
          print('Maior: $numero1 ' 'Menor: $numero2');
        } else if (numero2 > numero1) {
          print('Maior: $numero2 ' 'Menor: $numero1');
        } else {
          print("São iguais.");
        }
        break;

      case 5:
              print("Insira uma nota de 0 a 100: ");
        int nota = int.parse(stdin.readLineSync()!);

        if(nota < 0 || nota > 100){
          print("nota inválida");
        }
        else if (nota >= 90) {
          print("A");
        }
        else if (nota >= 89) {
          print("B");
        }
        else if (nota >= 79) {
          print("C");
        }
        else if (nota >= 69) {
          print("D");
        }
        else if (nota < 60) {
          print("F");
        } else {
        }
        break;

      case 6:
        print("Digite um número: ");
        int numero = int.parse(stdin.readLineSync()!);
        
        for (int i = 1; i <= numero; i++) {
          print("Número: $i");
        }
        break;
        
      case 7:
        print("Digite um número: ");
        int numero = int.parse(stdin.readLineSync()!);

        int soma = 0;
        int contador = 1;

        while (contador <= numero){
          soma += contador;
          contador++;
        }
        print("A soma de 1 até $numero é $soma");
        break;

      case 8:
        print("Digite um número: ");
        int numero = int.parse(stdin.readLineSync()!);

        for(int i = 1; i <= 10; i++) {
          print("$numero x $i = ${numero * i}");
        }
        break;

      case 9:
        print("Saindo...");
        return;
      default:
        print("Escolha apenas valores entre 1 e 9.");
    }
  }
}
