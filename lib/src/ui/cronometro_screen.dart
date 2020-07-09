import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/text_field.dart';

import 'dart:io';

import 'package:flutter/services.dart';

class Cronometro extends StatefulWidget {
  @override
  _Cronometro createState() => _Cronometro();
}

class _Cronometro extends State<Cronometro> {
  var color = Colors.amber;
  var _texto = new TextStyle(fontSize: 25);
  var texto = new Text('');
  var alarma = TextStyle(color: Colors.black);
  final s = 60;

  Timer timer;
  TextEditingController myContador = new TextEditingController();
  TextEditingController mySegundos = new TextEditingController();

  int contador;
  int seg;
  int temp;
  bool bloqueo;

  @override
  void initState() {
    contador = 0;
    seg = 0;
    temp = 0;
    bloqueo = true;
    alarma;
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
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 100,
                  child: TextField(
                    enabled: bloqueo,
                    controller: myContador,
                    decoration: InputDecoration(labelText: 'Minutos'),
                    keyboardType: TextInputType.number,
                    style: alarma,
                  )),
            ],
          ),
          SizedBox(
            width: 5.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(''), Text(''), Text(':')],
          ),
          SizedBox(
            width: 5.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 100,
                  child: TextField(
                    enabled: bloqueo,
                    controller: mySegundos,
                    decoration: InputDecoration(labelText: 'Segundos'),
                    keyboardType: TextInputType.number,
                    style: alarma,
                  )),
            ],
          ),
        ],
      )),
      floatingActionButton: _CrearBotones(),
    );
  }

  Widget _CrearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.restore),
          onPressed: _pause,
          heroTag: "btn5",
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

/*
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
*/

  void _play() {
    bloqueo = false;
    if (myContador.text == '') {
      setState(() {
        myContador.text = '0';
        contador = 0;
      });
    } else {
      contador = int.parse(myContador.text);
    }
    if (mySegundos.text == '') {
      setState(() {
        mySegundos.text = '0';
        seg = 0;
      });
    } else {
      seg = int.parse(mySegundos.text);
    }

    // contador = int.parse(myContador.text);
    // seg = int.parse(mySegundos.text);

    if (contador >= 0 && seg >= 0) {
      timer = new Timer.periodic(Duration(seconds: 1), (Timer t) => _tiempo());
    }
  }

  void _pause() {
    print('este es el $contador : $temp : $seg');
    setState(() {
      myContador.text = '';
      mySegundos.text = '';
      contador = 0;
      seg = 0;
      bloqueo = true;
      alarma = new TextStyle(color: Colors.black);
    });
    return timer.cancel();
  }

  void _tiempo() {
    if (contador >= 0 && seg >= 0) {
      if (contador > 0 && seg == 0) {
        contador--;
        seg = s;
        seg--;
        print('segundos $seg');
        setState(() {
          String min = contador.toString();
          myContador.value = TextEditingValue(text: min);
          String segun = seg.toString();
          mySegundos.value = TextEditingValue(text: segun);
        });
      } else if (contador > 0 && seg <= s && seg > 0) {
        seg--;
        print('segundos $seg');
        setState(() {
          String segun = seg.toString();
          mySegundos.value = TextEditingValue(text: segun);
        });
      } else if (contador == 0 && seg <= s && seg > 0) {
        if (contador == 0 && seg <= 11) {
          seg--;
          print('Ultimos $seg');
          setState(() {
            String segun = seg.toString();
            mySegundos.value = TextEditingValue(text: segun);
            alarma = new TextStyle(color: Colors.red);
          });
        } else if (contador == 0 && seg > 11) {
          seg--;
          print('Ultimos $seg');
          setState(() {
            String segun = seg.toString();
            mySegundos.value = TextEditingValue(text: segun);
          });
        }
      } else if (contador == 0 && seg == 0) {
        setState(() {
          myContador.text = '';
          mySegundos.text = '';
          contador = 0;
          seg = 0;
          bloqueo = true;
          alarma = new TextStyle(color: Colors.black);
        });
        return timer.cancel();
      }
    } else {
      return timer.cancel();
    }
  }
}
