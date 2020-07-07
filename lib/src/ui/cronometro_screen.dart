import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/services.dart';

class Cronometro extends StatefulWidget {
  @override
  _Cronometro createState() => _Cronometro();
}

class _Cronometro extends State<Cronometro> {
  var color = Colors.amber;
  var _texto = new TextStyle(fontSize: 25);
  Timer timer;

  int contador;
  int seg;
  int temp;

  @override
  void initState() {
    contador = 0;
    seg = 0;
    temp = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Cronometro'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Minutos',
              style: _texto,
            ),
            Text(
              '$contador',
              style: _texto,
            )
          ],
        ),
      ),
      floatingActionButton: _CrearBotones(),
    );
  }

  Widget _CrearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
            child: Icon(Icons.remove),
            backgroundColor: color,
            onPressed: _remove,
            heroTag: "btn2"),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: color,
          onPressed: _add,
          heroTag: "btn3",
        ),
        Expanded(
          child: SizedBox(),
        ),
        FloatingActionButton(
          child: Icon(Icons.restore),
          onPressed: _pause,
          heroTag: "btn5",
        ),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          backgroundColor: Colors.lightGreen,
          onPressed: _play,
          heroTag: "btn4",
        ),
      ],
    );
  }

  _PatternVibrate() {
    HapticFeedback.heavyImpact();

    sleep(
      const Duration(milliseconds: 200),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 500),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 200),
    );
    HapticFeedback.mediumImpact();
  }

  void _add() {
    setState(() => contador++);
  }

  void _remove() {
    if (contador > 0) {
      setState(() => contador--);
    } else {
      return;
    }
  }

  void _reset() {
    setState(() => contador = 0);
  }

  void _play() {
    if (contador > 0) {
      seg = contador * 60;
      timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => _tiempo());
    }
  }

  void _pause() {
    print('este es el $contador : $temp : $seg');
    setState(() {
      contador = 0;
      temp = 0;
    });
    return timer.cancel();
  }

  void _tiempo() {
    if (contador > 0) {
      seg--;
      temp++;
      print('segundos $seg');
      setState(() {
        seg;
      });

      if (temp == 60 && seg > 10) {
        print('minutos $contador');
        setState(() {
          temp = 0;
          contador--;
        });
      } else if (seg <= 10) {
        print('minutos ultimo $contador'); //ALARMA
        _texto = new TextStyle(color: Colors.red[900]);
        setState(() {
          _texto;
        });
        _PatternVibrate();

        if (seg == 0) {
          setState(() {
            temp = 0;
            contador--;
          });
        }
      }
    } else {
      return timer.cancel();
    }
  }
}
