import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerEstatico extends StatefulWidget{
  _Drawer createState() => _Drawer();
}
class _Drawer extends State<DrawerEstatico>{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('MENU',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
            ),
          ),
          ListTile(
            title: Text('Contador'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context,  '/contador');
            },
          ),
          ListTile(
            title: Text('Calculadora'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context,  '/calculadora');
            },
          ),
        ],
      ),
    );
  }
}