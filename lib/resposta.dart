import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onPressed;

  const Resposta({
    Key? key,
    required this.texto,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
        child: Text(texto),
      ),
    );
  }
}
