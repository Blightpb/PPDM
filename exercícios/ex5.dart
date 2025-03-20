import 'dart:io';
void notaConceito() {
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
}