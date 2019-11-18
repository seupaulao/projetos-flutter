import 'package:flutter/material.dart';

class CVEL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Velocidades"),
      ),
      body: CVELWidget(),
    );
  }
}

class CVELWidget extends StatefulWidget {
  @override
  _CVELWidgetState createState() => _CVELWidgetState();
}

class _CVELWidgetState extends State<CVELWidget> {

  var _metroPorSegundo = TextEditingController();
  var _quilometrosPorHora = TextEditingController();
  var _milhasPorHora = TextEditingController();
  var _nos = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
          TextField(
            controller: _metroPorSegundo,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Metro por segundo", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _quilometrosPorHora,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Quilômetros por hora", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _milhasPorHora,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Milhas por hora", 
              labelStyle: TextStyle(
                color: Colors.blue)),
          ),
          TextField(
            controller: _nos,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center, 
            decoration: InputDecoration(
              labelText: "Nós", 
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
    );
  }

  void _limpar(){
     setState(() {
       _nos.text = "";
       _quilometrosPorHora.text = "";
       _milhasPorHora.text = "";
       _metroPorSegundo.text = "";
     });
  }

  void _calcular(){
      double kmh = 0;
      double mps = 0;
      double mph = 0;
      double nos = 0;
      if (_metroPorSegundo.text.isNotEmpty)
      {
          mps = double.parse(_metroPorSegundo.text);
          kmh = 3.6 * mps;
          mph = 2.23694 * mps;
          nos = 1.94384 * mps; 
      }
      else if (_quilometrosPorHora.text.isNotEmpty) {
          kmh = double.parse(_quilometrosPorHora.text);
          mps = kmh / 3.6;
          mph = 2.23694 * mps;
          nos = 1.94384 * mps; 
      }
      else if (_milhasPorHora.text.isNotEmpty) {
          mph = double.parse(_milhasPorHora.text);
          mps = mph / 2.23694;
          kmh = 3.6 * mps;
          nos = 1.94384 * mps; 
      }
      else if (_nos.text.isNotEmpty) {
          nos = double.parse(_nos.text);
          mps = nos / 1.94384;
          kmh = 3.6 * mps;
          mph = 2.23694 * mps;
      }

      setState(() {
        _metroPorSegundo.text = mps.toStringAsFixed(2);
        _quilometrosPorHora.text = kmh.toStringAsFixed(2);
        _milhasPorHora.text = mph.toStringAsFixed(2);
        _nos.text = nos.toStringAsFixed(2);
      });
  }

}
