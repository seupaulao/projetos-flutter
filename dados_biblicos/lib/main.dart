import 'package:flutter/material.dart';
import 'leitura.dart';
import 'quantitativo.dart';
import 'dicionario.dart';
import 'dart:convert';

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
      },
    )
  );
}

/*
leitura e analise : realizar a leitura e ao clicar no verso a análise:
   1. referência cruzada
   2. referência strong do verso com análise gramatical e de possiveis significados
   3. analisar verso, buscar no dicionário
   4. contar quantidade de palavras no original grego
   5. contar quantidade de palavras na versão blv

dados quantitativos : resumo quantitativo da biblia

  1. Numero de livros
  2. Numero de capitulos
  3. Numero de versos
  4. Numero de palavras
  5. Lista
        Livro     numero de capitulos    numero de versos     numero de palavras
  6. Maior livro     numero de capitulos     numero de versos
  7. Menor livro     numero de capitulos     numero de versos
  8. Maior capitulo     numero de versos     numero de palavras
  9. Menor capitulo     numero de versos     numero de palavras
  10. Maior verso
  11. Menor verso

dicionário : buscar no catálogo ou buscar palavra

 */
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
          ],
        ),
        )
      
    );
  }
}

