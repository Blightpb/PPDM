import 'dart:io';

class Funcionario {
  String _nome = "";
  double _salario = 0;

  String get nome => _nome;

  set nome(String valor) {
    _nome = valor;
  }

  double get salario => _salario;

  set salario(double valor) {
    if (valor > 0) {
      _salario = valor;
    } else {
      print("Insira um valor positivo");
    }
  }
}

void salario() {
  Funcionario funcionario = Funcionario();

  stdout.write("Digite o nome do funcionário(a): ");
  funcionario.nome = stdin.readLineSync() ?? '';

  stdout.write("Digite o salário dele(a): ");
  double? salario = double.tryParse(stdin.readLineSync() ?? '');

  if (salario != null) {
    funcionario.salario = salario;
  } else {
    print("salário inválido");
  }

  print("\n");
  print("Nome: ${funcionario.nome}");
  print("Salário: ${funcionario.salario}\n");
}