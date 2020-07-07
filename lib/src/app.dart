import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:utilidades/src/ui/calculadora_screen.dart';
import 'package:utilidades/src/ui/contador_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "INICIO",
      routes: <String, WidgetBuilder>{
        "/calculadora": (BuildContext context) => CalculadoraScreen(),
        "/contador": (BuildContext context) => ContadorScreen(),
      },
      home: CalculadoraScreen(),
    );
  }
}
