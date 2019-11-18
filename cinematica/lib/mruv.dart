import 'package:flutter/material.dart';

class MRUV extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("M.R.U.V."),
       ),
       body: MRUVWidget()
    );
  }

}

class MRUVWidget extends StatefulWidget {
  @override
  _MRUVWidgetState createState() => _MRUVWidgetState();
}

class _MRUVWidgetState extends State<MRUVWidget> {

  final _espacoFinal = TextEditingController();
  final _espacoInicial = TextEditingController();
  final _velocidadeFinal = TextEditingController();
  final _velocidadeInicial = TextEditingController();
  final _aceleracao = TextEditingController();
  final _tempo = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           TextField(
             controller: _espacoFinal,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue),
                labelText: "Espaço Final (m)"
           ),),
           TextField(
             controller: _espacoInicial,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue),
                labelText: "Espaço Inicial (m)"
           ),),
           TextField(
             controller: _velocidadeFinal,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue),
                labelText: "Velocidade Final (m/2)"
           ),),
           TextField(
             controller: _velocidadeInicial,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue),
                labelText: "Velocidade Inicial (m/s)"
           ),),
           TextField(
             controller: _aceleracao,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue),
                labelText: "Aceleração (m/s^2)"
           ),),
           TextField(
             controller: _tempo,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.blue),
                labelText: "Tempo (s)"
           ),),
           Container(
             padding: const EdgeInsets.only(top: 15,left: 5, right: 5),
             height: 50,
             child:  Row(
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
,
           ),
         ],
       );
  }

  /*
  2.  V = Vo + a * t    
  3.  S = So + Vo * t + a * t^2 / 2  (função horária mruv)
  4.  V^2 = Vo^2 + 2 * a * (S-So)    (equação de torricelli)
*/

  void _calcular(){
    double a = 0;
    double t = 0;
    double vo = 0;
    double v = 0;
    double so = 0;
    double s = 0;
    if (_velocidadeInicial.text.length > 0 && _aceleracao.text.length > 0 && _tempo.text.length > 0) {
      vo = double.parse(_velocidadeInicial.text ?? 0);
      t = double.parse(_tempo.text ?? 0);
      a = double.parse(_aceleracao.text ?? 0);
      v = vo + a*t;
    }
    //TODO colocar caso de outras formulas aqui
    setState(() {
      _velocidadeFinal.text = v.toStringAsFixed(2);
      _velocidadeInicial.text = vo.toStringAsFixed(2);
      _tempo.text = t.toStringAsFixed(2);
      _aceleracao.text = a.toStringAsFixed(2);
      _espacoFinal.text = s.toStringAsFixed(2);
      _espacoInicial.text = so.toStringAsFixed(2);
    });

  }
  void _limpar() {
    setState(() {
      _aceleracao.text='';
      _tempo.text='';
      _velocidadeInicial.text='';
      _velocidadeFinal.text='';
      _espacoFinal.text='';
      _espacoInicial.text='';
    });
  }
}
