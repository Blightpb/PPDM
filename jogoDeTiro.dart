import 'dart:io';
import 'dart:math';

class JogoTiro {
  final int largura = 20;
  late int alvo;
  int jogador = 10;

  JogoTiro() {
    alvo = Random().nextInt(largura);
  }

  void exibirJogo() {
    for (int i = 0; i < largura; i++) {
      if (i == jogador) {
        stdout.write('🔫');
      } else if (i == alvo) {
        stdout.write('🎯');
      } else {
        stdout.write('-');
      }
    }
    print('');
  }

  void moverJogador(String direcao) {
    if (direcao == 'a' && jogador > 0) {
      jogador--;
    } else if (direcao == 'd' && jogador < largura - 1) {
      jogador++;
    }
  }

  bool atirar() {
    return jogador == alvo;
  }
}

void main() {
  print("Deseja jogar com 1 ou 2 jogadores?");

  String? escolha = stdin.readLineSync();

  switch (escolha) {
    case '1':
      JogoTiro jogo = JogoTiro();
      String? comando;

      print("\n=== JOGO DE TIRO ===");
      print("Use 'a' para esquerda, 'd' para direita e 'f' para atirar!\n");

      while (true) {
        jogo.exibirJogo();
        stdout.write("Comando: ");
        comando = stdin.readLineSync();

        if (comando == 'a' || comando == 'd') {
          jogo.moverJogador(comando!);
        } else if (comando == 'f') {
          if (jogo.atirar()) {
            print("\n🎯 Você acertou o alvo! Parabéns! 🎯\n");
            break;
          } else {
            print("\n💥 Errou! Tente novamente.\n");
          }
        } else {
          print("\nComando inválido! Use 'a', 'd' ou 'f'.\n");
        }
      }
      break;

    case '2':
      print("Você escolheu o caso 2. Aqui você pode implementar outro código.");
      break;

    default:
      print("Opção inválida!");
  }
}
