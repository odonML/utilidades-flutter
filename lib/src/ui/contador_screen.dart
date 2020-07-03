import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:utilidades/src/resources/drawer_estatico.dart';


class ContadorScreen extends StatefulWidget {
 _Contador createState() => _Contador();
}

class _Contador extends State<ContadorScreen>{
  final color= const Color(0xff807d8b);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Flutter',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: Text('Contador'),
        ),
        body: Center(
          child: Text('Contador'),
        ),
        drawer: DrawerEstatico(),
      ),
    );
  }
}