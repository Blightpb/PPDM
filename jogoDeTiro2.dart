import 'dart:io';
import 'dart:math';

class JogoTiro {
  final int largura = 20;
  late int alvo;
  int jogador1 = 10; // Posição inicial do Jogador 1
  int jogador2 = 15; // Posição inicial do Jogador 2

  JogoTiro() {
    alvo = Random().nextInt(largura);
  }

  void exibirJogo() {
    for (int i = 0; i < largura; i++) {
      if (i == jogador1) {
        stdout.write('🔫'); // Jogador 1
      } else if (i == jogador2) {
        stdout.write('🔫'); // Jogador 2
      } else if (i == alvo) {
        stdout.write('🎯'); // Alvo
      } else {
        stdout.write('-'); // Espaço vazio
      }
    }
    print('');
  }

  void moverJogador(int jogador, String direcao) {
    if (jogador == 1) {
      if (direcao == 'a' && jogador1 > 0) {
        jogador1--;
      } else if (direcao == 'd' && jogador1 < largura - 1) {
        jogador1++;
      }
    } else if (jogador == 2) {
      if (direcao == 'a' && jogador2 > 0) {
        jogador2--;
      } else if (direcao == 'd' && jogador2 < largura - 1) {
        jogador2++;
      }
    }
  }

  bool atirar(int jogador) {
    if (jogador == 1) {
      return jogador1 == alvo;
    } else {
      return jogador2 == alvo;
    }
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
        comando = stdin.readLineSync();

        if (comando == 'a' || comando == 'd') {
          jogo.moverJogador(1, comando!);
        } else if (comando == 'f') {
          if (jogo.atirar(1)) {
            print("\n🎯 Jogador 1 acertou o alvo! Parabéns! 🎯\n");
            break;
          } else {
            print("\n💥 Jogador 1 errou! Tente novamente.\n");
          }
        } else {
          print("\nComando inválido! Use 'a', 'd' ou 'f'.\n");
        }
      }
      break;

    case '2':
      JogoTiro jogo = JogoTiro();
      String? comando;
      bool jogador1Venceu = false;
      bool jogador2Venceu = false;

      print("\n=== JOGO DE TIRO - 2 JOGADORES ===");
      print("Use 'a' para esquerda, 'd' para direita e 'f' para atirar!\n");

      while (true) {
        jogo.exibirJogo();

        // Jogador 1
        stdout.write("Jogador 1: ");
        comando = stdin.readLineSync();
        if (comando == 'a' || comando == 'd') {
          jogo.moverJogador(1, comando!);
        } else if (comando == 'f') {
          if (jogo.atirar(1)) {
            print("\n🎯 Jogador 1 acertou o alvo! Parabéns! 🎯\n");
            jogador1Venceu = true;
          } else {
            print("\n💥 Jogador 1 errou! Tente novamente.\n");
          }
        } else {
          print("\nComando inválido! Use 'a', 'd' ou 'f'.\n");
        }

        if (jogador1Venceu) {
          break;
        }

        // Jogador 2
        stdout.write("Jogador 2: ");
        comando = stdin.readLineSync();
        if (comando == 'a' || comando == 'd') {
          jogo.moverJogador(2, comando!);
        } else if (comando == 'f') {
          if (jogo.atirar(2)) {
            print("\n🎯 Jogador 2 acertou o alvo! Parabéns! 🎯\n");
            jogador2Venceu = true;
          } else {
            print("\n💥 Jogador 2 errou! Tente novamente.\n");
          }
        } else {
          print("\nComando inválido! Use 'a', 'd' ou 'f'.\n");
        }

        if (jogador2Venceu) {
          break;
        }
      }
      break;

    default:
      print("Opção inválida!");
  }
}
