import 'package:flutter/material.dart';

class CDIS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Distâncias"),
      ),
      body: CDISWidget(),
    );
  }
}

class CDISWidget extends StatefulWidget {
  @override
  _CDISWidgetState createState() => _CDISWidgetState();
}

class _CDISWidgetState extends State<CDISWidget> {

  var _metros = TextEditingController();
  var _centimetros = TextEditingController();
  var _milimetros = TextEditingController();
  var _jardas = TextEditingController();
  var _pes = TextEditingController();
  var _polegadas = TextEditingController();
  var _quilometros = TextEditingController();
  var _milhas = TextEditingController();
  var _leguas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
       children: <Widget>[
          TextField(
            controller: _milimetros,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Milimetros", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _centimetros,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Centimetros", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _metros,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Metros", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _jardas,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Jardas", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _pes,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Pés", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _polegadas,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Polegadas", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _quilometros,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Quilômetros", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _milhas,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Milhas", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _leguas,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Léguas", 
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
                )
            ],
          )

       ],
    ),
    );
    
    
  }

  void _limpar(){
     setState(() {
       _metros.text = '';
       _milimetros.text = '';
       _centimetros.text = '';
       _quilometros.text = '';
       _milhas.text = '';
       _leguas.text = '';
       _polegadas.text = '';
       _pes.text = '';
       _jardas.text = '';
     });
  }

  void _calcular(){
      double metros = 0;
      double centimetros = 0;
      double milimetros = 0;
      double quilometros = 0;
      double polegadas = 0;
      double pes = 0;
      double jardas = 0;
      double milhas = 0;
      double leguas = 0;
      if (_metros.text.isNotEmpty)
      {
          metros = double.parse(_metros.text);
          centimetros = 100 * metros ;
          milimetros = 1000 * metros ;
          jardas = 1.09361 * metros;
          pes = 3.28084 * metros;
          polegadas = 39.37008 * metros;
          milhas = metros / 1609.344;
          quilometros = metros / 1000;
          leguas = metros / 4828.032;
      }
      else if (_centimetros.text.isNotEmpty)
      {
          centimetros = double.parse(_centimetros.text);
          metros = centimetros/100 ;
          milimetros = 1000 * metros ;
          jardas = 1.09361 * metros;
          pes = 3.28084 * metros;
          polegadas = 39.37008 * metros;
          milhas = metros / 1609.344;
          quilometros = metros / 1000;
          leguas = metros / 4828.032;
      }
      else if (_milimetros.text.isNotEmpty)
      {
          milimetros = double.parse(_milimetros.text);
          metros = milimetros / 1000;
          centimetros = 100 * metros ;
          jardas = 1.09361 * metros;
          pes = 3.28084 * metros;
          polegadas = 39.37008 * metros;
          milhas = metros / 1609.344;
          quilometros = metros / 1000;
          leguas = metros / 4828.032;
      }

      else if (_jardas.text.isNotEmpty)
      {
          jardas = double.parse(_jardas.text);
          metros = jardas / 1.09361;
          milimetros = metros * 1000;
          centimetros = 100 * metros ;
          pes = 3.28084 * metros;
          polegadas = 39.37008 * metros;
          milhas = metros / 1609.344;
          quilometros = metros / 1000;
          leguas = metros / 4828.032;
      }
      else if (_pes.text.isNotEmpty)
      {
          pes = double.parse(_pes.text);
          metros = pes / 3.28084;
          milimetros = metros * 1000;
          centimetros = 100 * metros ;
          jardas = 1.09361 * metros;
          polegadas = 39.37008 * metros;
          milhas = metros / 1609.344;
          quilometros = metros / 1000;
          leguas = metros / 4828.032;
      }
      else if (_polegadas.text.isNotEmpty)
      {
          polegadas = double.parse(_polegadas.text);
          metros = polegadas / 39.37008;
          milimetros = 1000 * metros;
          centimetros = 100 * metros ;
          jardas = 1.09361 * metros;
          pes = 3.28084 * metros;
          milhas = metros / 1609.344;
          quilometros = metros / 1000;
          leguas = metros / 4828.032;
      }
      else if (_quilometros.text.isNotEmpty)
      {
          quilometros = double.parse(_quilometros.text);
          metros = 1000 * quilometros;
          centimetros = 100 * metros ;
          milimetros = 1000 * metros ;
          jardas = 1.09361 * metros;
          pes = 3.28084 * metros;
          polegadas = 39.37008 * metros;
          milhas = metros / 1609.344;
          leguas = metros / 4828.032;
      }
      else if (_milhas.text.isNotEmpty)
      {
          milhas = double.parse(_milhas.text);
          metros = 1609.344 * milhas;
          centimetros = 100 * metros ;
          milimetros = 1000 * metros ;
          jardas = 1.09361 * metros;
          pes = 3.28084 * metros;
          polegadas = 39.37008 * metros;
          quilometros = metros / 1000;
          leguas = metros / 4828.032;
      }
      else if (_leguas.text.isNotEmpty)
      {
          leguas = double.parse(_leguas.text);
          metros = 4828.032 * leguas;
          centimetros = 100 * metros ;
          milimetros = 1000 * metros ;
          jardas = 1.09361 * metros;
          pes = 3.28084 * metros;
          polegadas = 39.37008 * metros;
          milhas = metros / 1609.344;
          quilometros = metros / 1000;
      }


      setState(() {
        _metros.text = metros.toStringAsFixed(4);
        _quilometros.text = quilometros.toStringAsFixed(4);
        _milhas.text = milhas.toStringAsFixed(4);
        _leguas.text = leguas.toStringAsFixed(4);
        _centimetros.text = centimetros.toStringAsFixed(4);
        _milimetros.text = milimetros.toStringAsFixed(4);
        _polegadas.text = polegadas.toStringAsFixed(4);
        _jardas.text = jardas.toStringAsFixed(4);
        _pes.text = pes.toStringAsFixed(4);
      });
  }
}

