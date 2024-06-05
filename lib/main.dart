//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(appWidget());
}

class appWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 243, 33, 236),
          scaffoldBackgroundColor:
              Color.fromARGB(255, 245, 237, 237), // Cor de fundo aqui
          textTheme: TextTheme(
            bodyText1: TextStyle(
                color:
                    Color.fromARGB(255, 221, 99, 226)), // Cor do corpo do texto
            bodyText2: TextStyle(
                color: Color.fromARGB(
                    255, 237, 65, 223)), // Cor do corpo do texto (variação)
          ),
        ),
        home: Scaffold(
          body: HomePage(),
          bottomNavigationBar: creditos(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  TextEditingController realController = TextEditingController();
  TextEditingController dollarController = TextEditingController();
  TextEditingController euroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Conversor Monetário',
              style: TextStyle(
                  color: Color.fromARGB(255, 208, 20, 189),
                  decoration: TextDecoration.none),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: realController,
                    style: TextStyle(color: Color.fromARGB(255, 224, 28, 188)),
                    decoration: InputDecoration(
                        labelText: 'REAIS',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 239, 149, 237)),
                        prefixText: 'R\$', // Texto pré-definido
                        prefixStyle: TextStyle(
                            color: Color.fromARGB(255, 228, 133, 219))),
                    onChanged: (value) {
                      double realValue = double.tryParse(value) ?? 0.0;
                      double dollarValue = realValue /
                          5.20; // Supondo que 1 real = 0.192 dólares (5.20 reais = 1 dólar)
                      double euroValue = realValue /
                          5.55; // Supondo que 1 real = 0.180 euros (5.55 reais = 1 euro)
                      dollarController.text = dollarValue.toStringAsFixed(2);
                      euroController.text = euroValue.toStringAsFixed(2);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 40.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: dollarController,
                    style: TextStyle(color: Color.fromARGB(255, 237, 30, 234)),
                    decoration: InputDecoration(
                        labelText: 'DÓLARES',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 240, 33, 243)),
                        prefixText: 'U\$', // Texto pré-definido
                        prefixStyle: TextStyle(
                            color: Color.fromARGB(255, 206, 17, 219))),
                    onChanged: (value) {
                      double dollarValue = double.tryParse(value) ?? 0.0;
                      double realValue = dollarValue *
                          5.20; // Supondo que 1 dólar = 5.20 reais
                      double euroValue = realValue /
                          5.55; // Supondo que 1 dólar = 0.938 euros (5.55 reais = 1 euro)
                      realController.text = realValue.toStringAsFixed(2);
                      euroController.text = euroValue.toStringAsFixed(2);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 40.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: euroController,
                    style: TextStyle(color: Color.fromARGB(255, 243, 33, 208)),
                    decoration: InputDecoration(
                        labelText: 'EUROS',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 185, 51, 215)),
                        prefixText: '€U', // Texto pré-definido
                        prefixStyle: TextStyle(
                            color: Color.fromARGB(255, 227, 30, 234))),
                    onChanged: (value) {
                      double euroValue = double.tryParse(value) ?? 0.0;
                      double realValue =
                          euroValue * 5.55; // Supondo que 1 euro = 5.55 reais
                      double dollarValue = realValue /
                          5.20; // Supondo que 1 euro = 1.07 dólares (5.20 reais = 1 dólar)
                      realController.text = realValue.toStringAsFixed(2);
                      dollarController.text = dollarValue.toStringAsFixed(2);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 40.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class creditos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('By: Giovanna Cristina da Cruz'));
  }
}
