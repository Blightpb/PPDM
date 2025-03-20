import 'dart:io';
void contagemProgressiva() {
  print("Digite um número: ");
  int numero = int.parse(stdin.readLineSync()!);
  
  for (int i = 1; i <= numero; i++) {
    print("Número: $i");
  }
}


