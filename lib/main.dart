import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _phrases = [
    "Não é a linguagem de programação que define o programador, mas sim sua lógica. - David Ribeiro Guilherme",
    "Faça como um programador. Quando tudo está errado e confuso, apague tudo e recomece do zero. - Orlando Cordeiro",
    "Programador: ‘É simples, pode ser composto. Se firma no concreto e torna-se, abstrato.’ - Carlos Cesar",
    "Programadores e artistas são os únicos profissionais que têm como hobby a própria profissão. - Rafael Lain",
    "Uma linguagem não faz seu código ser bom, programadores bons fazem seu código ser bom. - Samuel Custódio",
    "A questão não é saber os códigos ou linhas de comando, é saber o que fazer com eles. - Sérgio Arena",
    "ERRAR RÁPIDO! - Ayrton Yagami, enfatizando a importância de aprender com os erros rapidamente",
    "Nove pessoas não podem fazer um bebê em um mês. - Fred Brooks, sobre a complexidade de projetos de software",
    "Só por que alguma coisa não faz o que você planejou que ela fizesse não quer dizer que ela seja inútil. - Thomas Edison, lembrando que falhas podem levar a descobertas valiosas",
    "Bons programadores sabem o que escrever. Os melhores sabem o que reescrever. - Eric Raymond, sobre a importância de revisar e melhorar o código",
    "Em teoria, teoria e prática são iguais. Na prática, não são. - Yoggi Berra, sobre a diferença entre teoria e aplicação na programação",
    "Se depurar é o processo de remoção de bugs do software, então programação deve ser o processo de colocação deles. - Edsger Dijkstra, uma reflexão sobre a natureza da programação",
  ];

  var _phraseSelected = "Clique abaixo para gerar uma frase";

  int _nextNumber = -1;
  int _lastNumber = -1;

  void _incrementCounter() {
    setState(() {
      _nextNumber = Random().nextInt(_phrases.length);
      while (_nextNumber == _lastNumber){
        _nextNumber = Random().nextInt(4);
      }
      _lastNumber = _nextNumber;
      _phraseSelected = _phrases[_nextNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases do dia'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/logo.png"),
                Text(
                  _phraseSelected,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 36,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54
                  ),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                  ),
                  child: const Text(
                    "Nova frase",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}