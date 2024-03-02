import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sobre o App'),
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: Text(
            'App de treinamento',
            style: TextStyle(
              color: Colors.green,
              fontSize: 25.0,
            ),
          ),
        ));
  }
}
