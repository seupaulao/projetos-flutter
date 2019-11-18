import 'package:flutter/material.dart';
import 'dart:math' as math;

class MCU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("M.C.U."),
      ),
      body: MCUWidget()
    );
  }
}

class MCUWidget extends StatefulWidget {
  @override
  _MCUWidgetState createState() => _MCUWidgetState();
}

class _MCUWidgetState extends State<MCUWidget> {

  final _velocidade = TextEditingController();
  final _velocidadeAngular = TextEditingController();
  final _espacoAngular = TextEditingController();
  final _raio = TextEditingController();
  final _acp = TextEditingController();
  final _tempo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextField(
            controller: _velocidade,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Velocidade (m/s)", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _velocidadeAngular,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Velocidade Angular(m/s)", 
              labelStyle: TextStyle(
                color: Colors.blue)),

          ),
          TextField(
            controller: _espacoAngular,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Espaço angular", 
              labelStyle: TextStyle(
                color: Colors.blue)),

          ),
          TextField(
            controller: _tempo,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Tempo (s)", 
              labelStyle: TextStyle(
                color: Colors.blue)),

          ),
          TextField(
            controller: _raio,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Raio (m)", 
              labelStyle: TextStyle(
                color: Colors.blue)),

          ),
          TextField(
            controller: _acp,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Aceleracao Centripeta (m/s^2)", 
              labelStyle: TextStyle(
                color: Colors.blue)),

          ),
        
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
      );
  }

  void _limpar() {
    setState(() {
      _acp.text = '';
      _espacoAngular.text = '';
      _raio.text='';
      _velocidade.text='';
      _velocidadeAngular.text='';
      _tempo.text='';
    });
  }
  void _calcular() {
    double acp = 0;
    double espacoAngular = 0;
    double raio = 0;
    double velocidade= 0;
    double velocidadeAngular = 0;
    double tempo = 0;
    if (_tempo.text.length > 0 && _raio.text.length > 0)
    {
      tempo = double.parse(_tempo.text);
      raio = double.parse(_raio.text);
      double f = 1/ tempo;
      velocidadeAngular = 2 * math.pi * f;
      espacoAngular = velocidadeAngular * tempo; 
      velocidade = velocidadeAngular / raio;
      acp = velocidadeAngular * velocidadeAngular * raio;
    }
    if (_tempo.text.length > 0 && _velocidade.text.length > 0)
    {
      tempo = double.parse(_tempo.text);
      velocidade = double.parse(_velocidade.text);
      double f = 1/ tempo;
      raio = velocidade / 2 * math.pi*f;
      velocidadeAngular = velocidade / raio;
      acp = velocidadeAngular * velocidadeAngular * raio;
      espacoAngular = velocidadeAngular * tempo;
    }
    if (_raio.text.length > 0 && _velocidade.text.length > 0)
    {
      raio = double.parse(_raio.text);
      velocidade = double.parse(_velocidade.text);
      velocidadeAngular = velocidade / raio;
      acp = velocidadeAngular * velocidadeAngular * raio;
      double f = velocidade / (2 * math.pi * raio);
      tempo = 1 / f;
      espacoAngular = velocidadeAngular * tempo;
    }
    if (_acp.text.length > 0 && _velocidade.text.length > 0)
    {
      acp = double.parse(_acp.text);
      velocidade = double.parse(_velocidade.text);
      raio = velocidade * velocidade / acp; 
      velocidadeAngular = velocidade / raio;
      double f = velocidadeAngular / 2 * math.pi;
      tempo = 1 / f;
      espacoAngular = velocidadeAngular * tempo;
    }
    if (_acp.text.length > 0 && _raio.text.length > 0)
    {
      acp = double.parse(_acp.text);
      raio = double.parse(_raio.text);
      velocidadeAngular = math.sqrt(acp / raio);
      velocidade = velocidadeAngular * raio;
      double f = velocidadeAngular / 2 * math.pi;
      tempo = 1 / f;
      espacoAngular = velocidadeAngular * tempo;
    }
    setState(() {
      _acp.text = acp == 0 ? '' : acp.toStringAsFixed(2);
      _espacoAngular.text = espacoAngular == 0 ? '' : espacoAngular.toStringAsFixed(2);
      _velocidade.text = velocidade == 0 ? '' : velocidade.toStringAsFixed(2);
      _velocidadeAngular.text = velocidadeAngular == 0 ? '' : velocidadeAngular.toStringAsFixed(2);
      _tempo.text = tempo == 0 ? '' : tempo.toStringAsFixed(2);
      _raio.text = raio == 0 ? '' : raio.toStringAsFixed(2);      
    });
  }
}
