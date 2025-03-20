import 'dart:io';

void comparador() {
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
  ;
}
