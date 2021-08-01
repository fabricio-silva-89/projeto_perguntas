import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita",
      "respostas": ["Preto", "Vermelho", "Verde", "Branco"],
    },
    {
      "texto": "Qual é o seu animal favorito",
      "respostas": ["Coelho", "Cobra", "Elefante", "Leão"],
    },
    {
      "texto": "Qual é o seu instrutor favorito?",
      "respostas": ["Maria", "João", "Leo", "Pedro"],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(
                      texto:
                          _perguntas[_perguntaSelecionada]["texto"].toString()),
                  ...respostas
                      .map((e) => Resposta(texto: e, onPressed: _responder))
                      .toList(),
                ],
              )
            : Center(
                child: Text(
                  "Parabéns!!!",
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}
