import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:utilidades/src/resources/drawer_dinamico.dart';
import 'package:utilidades/src/resources/drawer_estatico.dart';

class ContadorScreen extends StatefulWidget {
  _Contador createState() => _Contador();
}

class _Contador extends State<ContadorScreen> {
  var color = const Color(0xff807d8b);

  String timeString;
  int contador;
  Timer timer;

  @override
  void initState() {
    contador = 1;
    timeString =
        new DateFormat('dd-MM-yyyy hh:mm:ss a').format(new DateTime.now());
    timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Contador'),
      ),
      body: Center(
        child: Text(
          'Contador $timeString',
        ),
      ),
      drawer: DrawerDinamico(),
    );
  }

  void _getTime() {
    if (this.mounted) {
      print('mounted');

      final DateTime now = DateTime.now();
      final String formattedDateTime =
          new DateFormat('dd-MM-yyyy hh:mm:ss a').format(now);

      if (contador > 10) {
        color = Colors.amber;
      }

      setState(() {
        contador++;
        color;
        timeString = formattedDateTime;
      });
    }
  }

  @override
  void dispose() {
    setState(() {
      timer.cancel();
    });
    print("dispose");
    super.dispose();
  }
}
