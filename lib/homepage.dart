import 'package:app_imc/config/drawermenu.dart';
import 'package:flutter/material.dart';
// Baixar dependências de "https://pub.dev" e instalar usando as instruções
import 'package:animated_text_kit/animated_text_kit.dart';

// Site pub.dev
// flutter pub get para atualizar a lista de pacotes

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controladores dos campos
  TextEditingController pesoControle = TextEditingController();
  TextEditingController alturaControle = TextEditingController();

  // Variáveis do aplicativo
  String infoText = "Informe seus dados";

  // Objeto para testar os dados do form
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Método para limpar os campos
  void reserFields() {
    pesoControle.text = "";
    alturaControle.text = "";
    setState(() {
      infoText = "Informe seus dados";
      formKey = GlobalKey<FormState>();
    });
  }

  // Método para calcular o IMC
  void calculate() {
    setState(() {
      double peso = double.parse(pesoControle.text);
      double altura = double.parse(alturaControle.text);
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        // toStringAs... faz a precisão no caso de 4 digitos
        infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)}) kg";
      } else if (imc >= 18.6 && imc < 24.9) {
        infoText = "Peso Ideal (${imc.toStringAsPrecision(4)}) kg";
      } else if (imc >= 24.9 && imc < 29.9) {
        infoText = "Levemente acima do peso (${imc.toStringAsPrecision(4)}) kg";
      } else if (imc >= 29.9 && imc < 34.9) {
        infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)}) kg";
      } else if (imc >= 34.9 && imc < 39.9) {
        infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)}) kg";
      } else if (imc >= 40) {
        infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)}) kg";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Menu(),
        appBar: AppBar(
          title: const Text('Calculadora de IMC'),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              // Chama o método para limpar
              onPressed: reserFields,
              icon: const Icon(
                Icons.refresh,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        // SingleChildScrollView - Adiciona em um widget com barra de rolagem
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Form(
            // Passa a chave do formulário
            key: formKey,
            child: Column(
              // Alinhamento horizontal da coluna
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 120,
                  color: Colors.green,
                ),
                TextFormField(
                  // Define o tipo de entrada
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                  ),
                  // Nome do controller deste campo
                  controller: pesoControle,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira seu peso...";
                    }
                  },
                ),
                TextFormField(
                  // Define o tipo de entrada
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Altura (m)",
                    labelStyle: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                  ),
                  // Nome do controller deste campo
                  controller: alturaControle,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira sua altura...";
                    }
                  },
                ),
                // Widget de espaçamento

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    infoText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Horizon',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('MANEIRO'),
                      RotateAnimatedText('LEGAL'),
                      RotateAnimatedText('ESTUPENDO'),
                      RotateAnimatedText('FENOMENAL'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // Rodapé
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  calculate();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Calcular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ));
  }
}
