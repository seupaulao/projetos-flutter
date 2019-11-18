import 'package:flutter/material.dart';
import 'mru.dart';
import 'mruv.dart';
import 'mcu.dart';
import 'cvel.dart';
import 'cdis.dart';

void main() => runApp(
  MaterialApp(
    title: "Cinemática",
    initialRoute: '/',
     routes: {
        '/':(context) => Cinematica(),
        '/mru': (context) => MRU(),
        '/mruv': (context) => MRUV(),
        '/mcu': (context) => MCU(),
        '/cvel': (context) => CVEL(),
        '/cdis': (context) => CDIS(),
      },
  )
  );

class Cinematica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PJLA - Cinemática"),
      ),
      body: Center(
        child:   Padding(
          padding: EdgeInsets.all(10),
          child:           Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Icon(Icons.account_balance_wallet, size: 150, color: Colors.blue,),
          FlatButton(color: Colors.blue,child: Text("Movimento Retilineo Uniforme", style: TextStyle(color: Colors.white),), onPressed: () {
             Navigator.pushNamed(context, '/mru');
          },),
          FlatButton(color: Colors.lime[400],child: Text("Movimento Retilineo Uniformemente Variado"), onPressed: () {
             Navigator.pushNamed(context, '/mruv');
          },),
          FlatButton(color: Colors.red[400],child: Text("Movimento Circular Uniforme"), onPressed: () {
             Navigator.pushNamed(context, '/mcu');
          },),
          FlatButton(color: Colors.cyan,child: Text("Converter Velocidades"), onPressed: () {
             Navigator.pushNamed(context, '/cvel');
          },),
          FlatButton(color: Colors.teal,child: Text("Converter Distâncias"), onPressed: () {
             Navigator.pushNamed(context, '/cdis');
          },),

        ],
      ),

        )    

      ),
    );
  }
}


