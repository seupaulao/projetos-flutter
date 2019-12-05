import 'package:flutter/material.dart';

/*
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

 */


class TelaQuantitativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(10),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dados Quantitativos"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              child: Text("Voltar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )
    );
  }
}