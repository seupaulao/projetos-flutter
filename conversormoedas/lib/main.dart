import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const endereco='https://api.hgbrasil.com/finance';
void main() async {

  Map mapa = await getDados();
  print(mapa['results']['currencies']['USD']);
  runApp(Home());

}

Future<Map> getDados() async{
    http.Response resp = await http.get(endereco);
    return jsonDecode(resp.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _dolar = TextEditingController();
  var _euro = TextEditingController();
  var _real = TextEditingController();

  double precoDolar = 0;
  double precoEuro = 0;
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("\$ Conversor de Moedas \$ ", style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
          backgroundColor: Colors.amber,
        ),
        body: FutureBuilder<Map>(
            future: getDados(),
            builder: (context, snapshot) {
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                       return Container(
                         child: Text("Aguardando resposta..."),
                       );
                  default:
                       if (snapshot.hasError) {
                          return Container(
                            child: Text("Houve erro ao consultar..."),
                          );
                       } else {
                         var dados = snapshot.data;
                         precoDolar = double.parse(dados['results']['currencies']['USD']['buy']);
                         precoEuro = double.parse(dados['results']['currencies']['EUR']['buy']);
                         //print(dados['results']);
                         return Container(
                           padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.stretch,
                             children: <Widget>[
                               Icon(Icons.account_balance, size: 150,color: Colors.amber,),
                               TextField(
                                 controller: _dolar,
                                 onChanged: (item) {
                                       double valor = double.parse(item);
                                       double real = valor * precoDolar;
                                       setState(() {
                                         _euro.text = (real / precoEuro).toStringAsFixed(2);
                                         _real.text = real.toStringAsFixed(2);
                                       });
                                 },
                                 keyboardType: TextInputType.number,
                                 decoration: InputDecoration(
                                   labelText: "Dolar",
                                   labelStyle: TextStyle(color: Colors.amber)
                                 ),
                               ),
                               TextField(
                                 controller: _euro,
                                 onChanged: (item) {
                                       double valor = double.parse(item);
                                       double real = valor * precoEuro;
                                       setState(() {
                                         _dolar.text = (real / precoDolar).toStringAsFixed(2);
                                         _real.text = real.toStringAsFixed(2);
                                       });
                                 },
                                 keyboardType: TextInputType.number,
                                 decoration: InputDecoration(
                                   labelText: "Euro",
                                   labelStyle: TextStyle(color: Colors.amber)
                                 ),
                               ),
                               TextField(
                                 controller: _real,
                                 onChanged: (item) {
                                       double valor = double.parse(item);
                                       setState(() {
                                         _dolar.text = (valor / precoDolar).toStringAsFixed(2);
                                         _euro.text = (valor / precoEuro).toStringAsFixed(2);
                                       });
                                 },
                                 keyboardType: TextInputType.number,
                                 decoration: InputDecoration(
                                   labelText: "Real",
                                   labelStyle: TextStyle(color: Colors.amber)
                                 ),
                               ),
                             ],
                           ),
                         );
                       }     
                }
            },
          )
      ));
    }
  }
