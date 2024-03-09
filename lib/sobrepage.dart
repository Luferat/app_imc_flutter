import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o app'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        // alinhamento vertical
        mainAxisAlignment: MainAxisAlignment.center,
        // alinhamento horizontal
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/image1.jpg',
            width: 300.0,
            height: 200.0,
          ),
          const Text(
            'Senac TI',
            style: TextStyle(
              color: Colors.green,
              fontSize: 40.0,
            ),
          ),
          // definir espaçamento entre widget
          const SizedBox(
            height: 15.0,
          ),
          const Row(
            // abaixo o alinhamento é horizontal por ser uma linha
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Treinamento Flutter',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Icon(
                Icons.flutter_dash,
                color: Colors.green,
                size: 30,
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            'Março de 2024',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
