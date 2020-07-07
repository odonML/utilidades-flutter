import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:utilidades/src/resources/drawer_dinamico.dart';
//import 'package:utilidades/src/resources/drawer_estatico.dart';

class CalculadoraScreen extends StatefulWidget {
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<CalculadoraScreen>{
  final color= const Color(0xff807d8b);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: Text('Calculadora'),
        ),
        body: Center(
          child: Text('Calculadora'),
        ),
        drawer: DrawerDinamico(),
    );
  }
}