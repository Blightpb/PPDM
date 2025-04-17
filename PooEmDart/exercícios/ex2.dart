class ContaBancaria {
  String? _titular;
  double? _saldo;

  ContaBancaria() {
    _titular = "";
    _saldo = 0;
  }

  ContaBancaria.comNome(this._titular, this._saldo);

  String get titular => _titular!;

  set titular(String value) {
    _titular = value;
  }

  double get saldo => _saldo!;

  set saldo(double value) {
    _saldo = value;
  }
}

void contaBancaria() {
  ContaBancaria contaBancaria = ContaBancaria.comNome("Isa Agarra", 2.99);

  print("Conta Bancária: \n");
  print("Nome: ${contaBancaria.titular}\nsaldo: ${contaBancaria.saldo}");

}