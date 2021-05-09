import 'dart:math';

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final Map<String, String> params;

  Resultado({required this.params});

  @override
  Widget build(BuildContext context) {
    String _estado = "";
    String _msg = "";
    Color? _color = Colors.green[400];
    int _peso = int.parse(params.remove("peso")!);
    double _estatura = double.parse(params.remove("estatura")!) / 100;
    double resultado = _peso / pow(_estatura, 2);

    resultado = (resultado >= 99) ? 99.99 : resultado;

    if (resultado <= 18.5) {
      _estado = "bajo";
      _color = Colors.red;
    } else if (resultado > 18.5 && resultado <= 24.9) {
      _estado = "normal";
    } else if (resultado > 24.9 && resultado <= 29) {
      _estado = "en sobrepeso";
      _color = Colors.orange;
    } else if (resultado > 29 && resultado <= 34.5) {
      _estado = "en obesidad grado I";
      _color = Colors.red[600];
    } else if (resultado > 34.5 && resultado <= 39.9) {
      _estado = "en obesidad grado II";
      _color = Colors.red[700];
    } else {
      _estado = "en obesidad grado III";
      _color = Colors.red[900];
    }

    _msg = "Tiene un peso corporal $_estado.";

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: Container(
        color: Color.fromRGBO(9, 14, 33, 1),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: Text(
                    "Resultado",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(90, 90, 120, 0.7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  _estado.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: _color,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  resultado.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 170.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Container(
                                  child: Text(
                                    (_estado == "normal")
                                        ? " $_msg ¡Buen trabajo!"
                                        : _msg,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 30, 100, 1),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
