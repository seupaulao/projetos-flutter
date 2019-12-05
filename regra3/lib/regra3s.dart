import 'package:flutter/material.dart';

class TelaRegra3Simples extends StatefulWidget {
  @override
  _TelaNovaState createState() => _TelaNovaState();
}

class _TelaNovaState extends State<TelaRegra3Simples> {

  var _valorX = TextEditingController();
  var _valor1 = TextEditingController();
  var _valor2 = TextEditingController();
  var _valor3 = TextEditingController();

  var _onVisible=false;

  var _saida="";

  @override
  Widget build(BuildContext context) {

    return Container(
       padding: EdgeInsets.all(10),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Regra de 3 Simples"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("X"),
                TextField(
                  controller: _valor1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Valor 1"
                  ),
                ),
              ],
              ),
            Divider(),
            Row(
              children: <Widget>[
                TextField(
                  controller: _valor2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Valor 2"
                  ),
                ),
                TextField(
                  controller: _valor3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Valor 3"
                  ),
                ),
              ],

            ),
            Divider(),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _onVisible=false;
                        double vx = double.parse(_valorX.text);
                        double v1 = double.parse(_valor1.text);
                        double v2 = double.parse(_valor2.text);
                        double v3 = double.parse(_valor3.text);
                        vx = v1 * v2 / v3;
                        setState(() {
                          _valorX.text = vx.toStringAsFixed(2);
                        });
                  },
                  child: Text("Calcular"),
                ),
                RaisedButton(
                  child: Text("Limpar"),
                  onPressed: () {
                       _onVisible=false;
                      setState(() {
                        _valor1.text = "";
                        _valor2.text = "";
                        _valor3.text = "";
                        _valorX.text = "";
                      });
                  },
                )
              ],
            ),
            Container(
              child: Visibility(
                visible: _onVisible,
                child: Text("Valor de X = $_saida"),
              ),
            )
          ],
        ),
      )
    );

  }
}

