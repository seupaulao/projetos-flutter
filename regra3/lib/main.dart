import 'package:flutter/material.dart';
import 'eqlinear.dart';
import 'pinteira.dart';
import 'regra3c.dart';
import 'regra3s.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Dados Biblicos",
      initialRoute: '/',
      routes: {
        '/':(context) => TelaInicial() ,
        '/regra3s':(context) => TelaRegra3Simples() ,
        '/regra3c':(context) => TelaRegra3Composta() ,
        '/eqlinear':(context) => TelaEquacaoLinear() ,
        '/pinteira':(context) => TelaProgramacaoInteira() ,
      },
    )
  );
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dados Bíblicos"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 50),
              child: Icon(Icons.book, size: 150,color: Colors.indigo,),
            ),

            RaisedButton(
              color: Colors.green,
              child: Text("Calcular Regra de 3 Simples"),
              onPressed: () {
                  Navigator.pushNamed(context, '/regra3s');
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("Calcular Regra de 3 Composta"),
              onPressed: () {
                  Navigator.pushNamed(context, '/regra3c');                
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("Solucionar Sistemas Lineares"),
              onPressed: () {
                  Navigator.pushNamed(context, '/eqlinear');
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("Programação Linear - Inteira"),
              onPressed: () {
                  Navigator.pushNamed(context, '/pinteira');
              },
            ),
          ],
        ),
        )
      
    );
  }
}
