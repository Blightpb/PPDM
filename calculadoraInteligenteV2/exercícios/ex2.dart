import 'dart:io';

void calcularArea() {
  print("Insira a base do retângulo: ");
  int baseRetangulo = int.parse(stdin.readLineSync()!);

  print("Insira a altura do retângulo: ");
  int alturaRetangulo = int.parse(stdin.readLineSync()!);

  int area = baseRetangulo * alturaRetangulo;

  print("O cálculo da área do retângulo é de $area.");
}
