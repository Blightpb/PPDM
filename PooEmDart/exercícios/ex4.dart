class Aluno {
  String nome;
  double nota1;
  double nota2;

  Aluno(this.nome, this.nota1, this.nota2);
}

void aluno() {

  List<Aluno> aluno = [
    Aluno ("Isa Agarra", 50, 100),
    Aluno("Mini Isa", 80, 90),
    Aluno("Isão", 95, 95),
    Aluno("micro Isabele", 50, 50),
  ];

  for (var aluno in aluno) {
    double media = (aluno.nota1 + aluno.nota2) / 2;
    if (media >= 50) {
      print("${aluno.nome} foi aprovado(a)\n");
    }
  }
}