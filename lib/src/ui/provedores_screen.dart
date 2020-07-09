import 'package:flutter/material.dart';
import 'package:utilidades/src/blocs/operation/proveedores_request.dart';
import 'package:utilidades/src/resources/drawer_dinamico.dart';

class Proveedores extends StatefulWidget {
  @override
  _Proveedores createState() => _Proveedores();
}

class _Proveedores extends State<Proveedores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provedores'),
      ),
      body: Center(
        child: _allProveedores(),
      ),
      drawer: DrawerDinamico(),
    );
  }

  _allProveedores() {
    getProveedores().then((r) {
      print(r[0]);
    });
  }
}
