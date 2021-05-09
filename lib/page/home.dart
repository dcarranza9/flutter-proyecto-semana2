import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc/page/resultado.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pathMaleImg = "assets/images/human-male.png";
  var pathFemaleImg = "assets/images/human-female.png";

  var _menosPathImg = "assets/images/minus.png";
  var _masPathImg = "assets/images/plus.png";

  Color maleOp = Color.fromRGBO(90, 90, 120, 0.7);
  Color femaleOp = Color.fromRGBO(90, 90, 120, 0.7);

  double _estatura = 20;

  int _peso = 50;
  int _edad = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
        ),
        body: Container(
          color: Color.fromRGBO(9, 14, 33, 1),
          child: Column(
            children: [
              //Panel genero
              Expanded(
                child: getPanelGenero(),
              ),
              //Panel estatura
              Expanded(
                child: getPanelEstatura(),
              ),
              //Panel peso y edad
              Expanded(
                child: getPanelPesoEdad(),
              ),
              //panel button
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Resultado(
                                params: {
                                  "peso": _peso.toString(),
                                  "estatura": _estatura.toString()
                                },
                              ),
                            ),
                          );
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
        ));
  }

  getPanelPesoEdad() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(90, 90, 120, 0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Peso",
                      style: TextStyle(fontSize: 20.0, color: Colors.white70),
                    ),
                  ),
                  Text(
                    _peso.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            _peso -= 1;

                            setState(() {
                              _peso = (_peso < 0) ? 0 : _peso;
                            });
                          },
                          backgroundColor: Color.fromRGBO(165, 165, 175, 0.5),
                          child: Image.asset(_menosPathImg),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _peso += 1;

                          setState(() {
                            _peso = (_peso < 0) ? 0 : _peso;
                          });
                        },
                        backgroundColor: Color.fromRGBO(165, 165, 175, 0.5),
                        child: Image.asset(_masPathImg),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                color: Color.fromRGBO(90, 90, 120, 0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Edad",
                      style: TextStyle(fontSize: 20.0, color: Colors.white70),
                    ),
                  ),
                  Text(
                    _edad.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            _edad -= 1;

                            setState(() {
                              _edad = (_edad < 0) ? 0 : _edad;
                            });
                          },
                          backgroundColor: Color.fromRGBO(165, 165, 175, 0.5),
                          child: Image.asset(_menosPathImg),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _edad += 1;

                          setState(() {
                            _edad = (_edad > 120) ? 120 : _edad;
                          });
                        },
                        backgroundColor: Color.fromRGBO(165, 165, 175, 0.5),
                        child: Image.asset(_masPathImg),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  getPanelGenero() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _peso = 50;
                  _edad = 28;
                  _estatura = 170;
                  femaleOp = Color.fromRGBO(90, 90, 120, 0.7);
                  maleOp = Color.fromRGBO(90, 90, 120, 0.2);
                });
              },
              child: Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                    color: maleOp, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(pathMaleImg),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Hombre",
                        style: TextStyle(fontSize: 20.0, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _peso = 50;
                  _edad = 28;
                  _estatura = 150;
                  femaleOp = Color.fromRGBO(90, 90, 120, 0.2);
                  maleOp = Color.fromRGBO(90, 90, 120, 0.7);
                });
              },
              child: Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  //color: Color.fromARGB(28, 29, 50, 200),
                  color: femaleOp,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(pathFemaleImg),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Mujer",
                        style: TextStyle(fontSize: 20.0, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  getPanelEstatura() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(90, 90, 120, 0.7),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  Text(
                    "Estatura",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white70,
                    ),
                  ),
                  Row(children: [
                    Text(
                      _estatura.round().toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                      child: Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white70,
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ]),
            Row(children: [
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    thumbColor: Color.fromRGBO(255, 30, 100, 1),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  ),
                  child: Slider(
                    value: _estatura,
                    min: 0,
                    max: 300,
                    divisions: 300,
                    label: _estatura.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _estatura = value;
                      });
                    },
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
