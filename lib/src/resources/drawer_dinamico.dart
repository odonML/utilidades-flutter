import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utilidades/src/models/datos.dart';
import 'package:utilidades/src/models/pagina_model.dart';

class DrawerDinamico extends StatefulWidget{
  _Drawer createState() => _Drawer();
}
class _Drawer extends State<DrawerDinamico>{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: new ListView.builder(
//        itemCount es el encargado de saber cuantas veces se llamara a la funcion
          itemCount: paginas.length,
          itemBuilder: (BuildContext context, int index){
          return new ListTile(
            title: Text(paginas[index].titulo),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context,  paginas[index].url);
            },
          );
        }
      )
    );
  }
}