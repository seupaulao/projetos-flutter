import 'package:flutter/material.dart';
import 'leitura.dart';
import 'quantitativo.dart';
import 'dicionario.dart';
import 'pesquisar.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Dados Biblicos",
      initialRoute: '/',
      routes: {
        '/':(context) => TelaInicial() ,
        '/leitura':(context) => TelaLeitura() ,
        '/quantitativo':(context) => TelaQuantitativo() ,
        '/dicionario':(context) => TelaDicionario() ,
        '/pesquisar':(context) => TelaPesquisar() ,
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
              child: Icon(Icons.book, size: 150,color: Colors.green,),
            ),

            RaisedButton(
              color: Colors.green,
              child: Text("Leitura e Análise"),
              onPressed: () {
                  Navigator.pushNamed(context, '/leitura');
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("Dados Quantitativos"),
              onPressed: () {
                  Navigator.pushNamed(context, '/quantitativo');                
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("Dicionário"),
              onPressed: () {
                  Navigator.pushNamed(context, '/dicionario');
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text('Pesquisar Palavra/Texto'),
              onPressed: () {
                 Navigator.pushNamed(context, '/pesquisar');
              },
            )
          ],
        ),
        )
      
    );
  }
}

