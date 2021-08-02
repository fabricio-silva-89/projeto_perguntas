import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;

  const Resultado({
    Key? key,
    required this.pontuacao,
    required this.reiniciar,
  }) : super(key: key);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns";
    } else {
      return "Você é bom!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: reiniciar,
          child: Text("Reiniciar?"),
        )
      ],
    );
  }
}
