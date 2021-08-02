import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;

  const Questionario({
    Key? key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quantoResponder,
  }) : super(key: key);

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]["texto"].toString()),
        ...respostas.map((e) {
          return Resposta(
              texto: e["texto"].toString(),
              onPressed: () =>
                  quantoResponder(int.parse(e["nota"].toString())));
        }).toList(),
      ],
    );
  }
}
