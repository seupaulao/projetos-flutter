import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cálculo IMC',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Cálculo IMC'),
        ),
        body: ControlesWidget()
      ),
    );
  }
}

class ControlesWidget extends StatefulWidget {
  @override
  _ControlesWidgetState createState() => _ControlesWidgetState();
  }
  
 class _ControlesWidgetState extends State<ControlesWidget>{
    bool _onIMC=false;
    int _peso=0;
    int _altura=0;
    double _imc=0.0;

    @override
    Widget build(BuildContext context){
      return Center(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Text('Peso(kg): $_peso', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              Container(
                 margin: const EdgeInsets.all(30),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       FlatButton(child: Text("1", style: TextStyle(fontSize: 24),),onPressed: addPeso1,),
                       FlatButton(child: Text("5", style: TextStyle(fontSize: 24),),onPressed: addPeso5,),
                       FlatButton(child: Text("10", style: TextStyle(fontSize: 24),),onPressed: addPeso10,),
                     ],
                  ),
              ),
              Text('Altura(cm): $_altura', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              Container(
                 margin: const EdgeInsets.all(30),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       FlatButton(child: Text("1", style: TextStyle(fontSize: 24),),onPressed: addAltura1,),
                       FlatButton(child: Text("5", style: TextStyle(fontSize: 24),),onPressed: addAltura5,),
                       FlatButton(child: Text("10", style: TextStyle(fontSize: 24),),onPressed: addAltura10,),
                     ],
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  RaisedButton(
                      child: Text("Calcular"),
                      onPressed: (){
                        setState(() {
                          if (_altura > 0)
                          {
                            double daltura = _altura / 100.0;
                            _imc = _peso / (daltura * daltura);
                            _onIMC = true;
                          }
                          
                        });
                      },
                    ),
                  RaisedButton(
                      child: Text("Limpar"),
                      onPressed: (){
                        setState(() {
                          _onIMC=false;
                          _peso=0;
                          _altura=0;
                          _imc=0.0;
                        });
                      },
                    ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Visibility(
                  visible: _onIMC,
                  child: Text("IMC=$_imc", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), )
              ),

              )
              
            ],
            ),

          ),
        );
    }

  addPeso1() {
    setState(() {
      _peso += 1;
    });
  }
  addPeso5() {
    setState(() {
      _peso += 5;
    });
  }
  addPeso10() {
    setState(() {
      _peso += 10;
    });
  }
  addAltura1() {
    setState(() {
      _altura += 1;
    });
  }
  addAltura5() {
    setState(() {
      _altura += 5;
    });
  }

  addAltura10() {
    setState(() {
      _altura += 10;
    });
  }

}