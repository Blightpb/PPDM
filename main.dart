import 'package:flutter/material.dart';

void main() {
  // Ponto de entrada do app
  runApp(AnimalQuizApp());
}

// Widget raiz do aplicativo
class AnimalQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Que animal você seria?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade50,
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18),
        ),
      ),
      home: StartScreen(), // Tela inicial
    );
  }
}

// === StartScreen ===
// Tela de boas-vindas com botão para iniciar o quiz
class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Descubra seu animal interior')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🐾 Você já se perguntou que animal reflete sua personalidade?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navega para QuizScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => QuizScreen()),
                  );
                },
                child: Text('Começar o Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// === QuizScreen ===
// Tela que apresenta perguntas e coleta respostas
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0; // Índice da pergunta atual
  Map<String, int> _scores = {
    // Armazena pontuação por animal
    'Coruja': 0,
    'Golfinho': 0,
    'Pássaro': 0,
    'Peixe': 0,
    'Cachorro': 0,
    'Gato': 0,
  };

  // Lista de perguntas, cada uma com mapa de opções -> animal
  final _questions = [
    //questão 1
    {
      'question': 'O que você prefere fazer no tempo livre?',
      'answers': {
        'Ler ou estudar': 'Coruja',
        'Conversar e conhecer pessoas novas': 'Golfinho',
        'Ouvir música': 'Pássaro',
        'Sair para vários lugares': 'Coelho',
        'Praticar esportes': 'Cachorro',
        'Comer e descansar': 'Gato',
      },
    },
    //questão 2
    {
      'question': 'Como você se descreveria?',
      'answers': {
        'Inteligente e estudioso(a)': 'Coruja',
        'Divertido(a) e alegre': 'Golfinho',
        'Espalhafatoso e sociável ': 'Pássaro',
        'Tímido(a) e criativo': 'Coelho',
        'Leal e confiável': 'Cachorro',
        'Quieto(a) e tranquilo': 'Gato',
      },
    },
    //questão 3
    {
      'question': 'quais ambientes você prefere estar?',
      'answers': {
        'natureza e ar livre': 'Coruja', 
        'Praia e piscina': 'Golfinho',
        'Parques e praças ': 'Pássaro',
        'Restaurantes': 'Coelho',
        'Festas e lojas': 'Cachorro',
        'Em casa no meu quarto': 'Gato',
      },
    },
    //questão 4
    {
      'question': 'Qual sua sobremesa favorita?',
      'answers': {
        'Salada de frutas': 'Coruja', 
        'Sorvete': 'Golfinho',
        'Cookies': 'Pássaro',
        'Bolo de cenoura': 'Coelho',
        'Chocolate': 'Cachorro',
        'Petit gateau': 'Gato',
      },
    },
    //questão 5
    {
      'question': 'Se você pudesse ser uma cantora quem você seria?',
      'answers': {
        'Madonna': 'Coruja', 
        'Charli xcx': 'Golfinho',
        'marina and the diamonds': 'Pássaro',
        'Britney Spears': 'Coelho',
        'Lady gaga': 'Cachorro',
        'Ariana Grande': 'Gato',
      },
    },
    //questão 6
    {
      'question': 'Escolha uma matéria da escola',
      'answers': {
        'Língua Portuguesa': 'Coruja', 
        'Matemática': 'Golfinho',
        'Física': 'Pássaro',
        'Artes': 'Coelho',
        'Educação física': 'Cachorro',
        'História': 'Gato',
      },
    },
    //questão 7
    {
      'question': 'Qual sua cor favorita?',
      'answers': {
        'Vermelho': 'Coruja', 
        'Azul': 'Golfinho',
        'Verde': 'Pássaro',
        'Rosa': 'Coelho',
        'Amarelo': 'Cachorro',
        'Roxo': 'Gato',
      },
    },
    //questão 8
    {
      'question': 'Como você trata seus amigos?',
      'answers': {
        'Com empatia e respeito': 'Coruja', 
        'Com brincadeiras e piadas': 'Golfinho',
        'Com carinho': 'Pássaro',
        'Com agressão': 'Coelho',
        'Com apelidos fofos': 'Cachorro',
        'Com ironia': 'Gato',
      },
    },
    //questão 9
    {
      'question': 'Que super poder você teria?',
      'answers': {
        'Visão noturna': 'Coruja', 
        'Respirar em baixo da água': 'Golfinho',
        'Voar': 'Pássaro',
        'Super pulo': 'Coelho',
        'Super velocidade': 'Cachorro',
        'Invisibilidade': 'Gato',
      },
    },
    //questão 10
    {
      'question': 'Qual seu pastel favorito',
      'answers': {
        'Carne': 'Coruja', 
        'Queijo': 'Golfinho',
        'Carne com queijo': 'Pássaro',
        'Frango': 'Coelho',
        'Palmito': 'Cachorro',
        'Nutella': 'Gato',
      },
    },
  ];

  // Método chamado ao selecionar uma resposta
  void _answerQuestion(String animal) {
    setState(() {
      _scores[animal] = _scores[animal]! + 1;
      _questionIndex++;
    });

    // Se acabou as perguntas, navega para tela de resultado
    if (_questionIndex >= _questions.length) {
      String resultAnimal = _getResultAnimal();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ResultScreen(animal: resultAnimal)),
      );
    }
  }

  // Retorna o animal com maior pontuação
  String _getResultAnimal() {
    return _scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  @override
  Widget build(BuildContext context) {
    var current = _questions[_questionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Pergunta ${_questionIndex + 1} de ${_questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              current['question'] as String,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            ...(current['answers'] as Map<String, String>).entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(entry.value),
                  child: Text(entry.key),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === ResultScreen ===
// Tela que exibe o resultado final com emoji e descrição
class ResultScreen extends StatelessWidget {
  final String animal; // Animal definido

  ResultScreen({required this.animal});

  final _descriptions = {
    'Coruja': ' Você é uma coruja, muito sábia!',
    'Golfinho': 'Você é um golfinho',
    'Golfinho': '🐬 Você é alegre, comunicativo(a) e divertido(a)!',
    'Urso': '🐻 Você é tranquilo(a), acolhedor(a) e confiável!',

     'Coruja': 0,
    'Golfinho': 0,
    'Pássaro': 0,
    'Peixe': 0,
    'Cachorro': 0,
    'Gato': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seu animal interior')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Emoji + descrição
              Text(
                _descriptions[animal]!,
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Reinicia o quiz
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => StartScreen()),
                  );
                },
                child: Text('Refazer o Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
