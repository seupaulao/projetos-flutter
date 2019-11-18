import 'package:flutter/material.dart';

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