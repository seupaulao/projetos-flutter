import 'package:flutter/material.dart';

class MRU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("M.R.U."),
       ),
       body: MRUWidget()
    );
  }
}

class MRUWidget extends StatefulWidget {
  @override
  _MRUWidgetState createState() => _MRUWidgetState();
}

class _MRUWidgetState extends State<MRUWidget> {

  final _espaco = TextEditingController();
  final _velocidade = TextEditingController();
  final _tempo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           TextField(
             controller: _espaco,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue),
                labelText: "Espaço (m)"
           ),),
           TextField(
             controller: _velocidade,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue),
                labelText: "Velocidade (m/s)"
           ),),
           TextField(
             controller: _tempo,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue),
                labelText: "Tempo (s)"
           ),),
            Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                RaisedButton(
                  child: Text("Calcular"),
                  onPressed: () {
                      _calcular();
                  },
                ),
                RaisedButton(
                  child: Text("Limpar"),
                  onPressed: () {
                      _limpar();
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Voltar"),
                )
            ],
           )
         ],
       )
    );
    
    
  }

  void _calcular() {
    double velocidade;
    double tempo;
    double espaco;
    if (_espaco.text.length <= 0)
    {
      velocidade = double.parse(_velocidade.text);
      tempo = double.parse(_tempo.text);
      espaco = velocidade * tempo;
    }
    else if (_velocidade.text.length <= 0) {
      espaco = double.parse(_espaco.text);
      tempo = double.parse(_tempo.text);
      velocidade = espaco / tempo;
    }
    else if (_tempo.text.length <= 0) {
      espaco = double.parse(_espaco.text);
      velocidade = double.parse(_velocidade.text);
      tempo = espaco / velocidade;
    }
    setState(() {
      _espaco.text = espaco.toStringAsFixed(2);
      _velocidade.text = velocidade.toStringAsFixed(2);
      _tempo.text = tempo.toStringAsFixed(2);
    });
  }
  void _limpar(){
    setState(() {
      _espaco.text='';
      _tempo.text='';
      _velocidade.text='';
    });
  }
}
