import 'package:flutter/material.dart';

class Todo {
   final String title;
   final String description;
   Todo(this.title,this.description);
}

void main(){
  runApp(
    MaterialApp(
      title: "Navegando em Flutter",
      initialRoute: '/',
      routes: {
        '/':(context) => PrimeiraRota(),
        '/segunda': (context) => SegundaRota(),
        '/terceira': (context) => TerceiraRota(),
        '/quarta': (context) => QuartaRota(),
        '/todos': (context) => TelaTodos(
          todos: List.generate(20, 
          (i) => Todo(
            'Todo $i',
            'Uma descricao simplista para o item Todo $i'
          ))
        ),
        '/retorno': (context) => TelaRetornoDados(),
      },
    ));
}

class TelaRetornoDados extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Demonstracao retornando valor'),
      ),
      body: Column(
        children: <Widget>[
          Text('Demonstracao retornando valor'),
          FlatButton(child: Text("Voltar"), onPressed: () {
            Navigator.pop(context);
          },),
          Center(child: SelectionButton(),)
        ],
      ),
    );
  }
}

class SelectionButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        _navegarEMostrarSelecao(context);
      },
      child: Text("Clique em uma opção qualquer"),
    );
  }

  _navegarEMostrarSelecao(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final resultado = await Navigator.push(context, MaterialPageRoute(builder: (context) => TelaSelecao()));
    
        Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("$resultado")));
      }
        
}

class TelaSelecao extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pegue uma opção"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context,"Aceito isso");
                },
                child: Text("Sim! Aceito."),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context,"Não aceito essa parada");
                },
                child: Text("Não Aceito"),
              )
            )
          ],
        ),
      ),
    );
  }
  
}



class TelaTodos extends StatelessWidget {
  final List<Todo> todos;

  TelaTodos({Key key, @required this.todos}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: 
                ListView.builder(
                  itemCount: this.todos.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                      title: Text(todos[index].title),
                      onTap: (){
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => TelaDetalhar(todo: todos[index])));
                      },
                    ),
                    );
                  },
                )
    );
   }
  
}

class TelaDetalhar extends StatelessWidget{
  final Todo todo;

  const TelaDetalhar({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(todo.title,style: TextStyle(fontSize: 24, color: Colors.red),),
          Text(todo.description, style: TextStyle(fontSize: 18, color: Colors.blue),),
          FlatButton(child: Text("Voltar",style: TextStyle(fontSize: 18, color: Colors.black),),onPressed: (){
              Navigator.pop(context);
          },)
        ],
      ),

    );
  }
  
}


class PrimeiraRota extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Bem-vindo Tela 1", style: TextStyle(fontSize: 24, color: Colors.blueGrey),),
          FlatButton(
              color: Colors.amber, 
              child: Text("Para a Tela 2"),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SegundaRota()));
                Navigator.pushNamed(context, '/segunda');
              },
            ),
          FlatButton(
              color: Colors.amber[900], 
              child: Text("Para a Tela 3"),
              onPressed: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => TerceiraRota()));
               Navigator.pushNamed(context, '/terceira');
              },
            ),
          FlatButton(
              color: Colors.green[200], 
              child: Text("Para a Tela 4"),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => QuartaRota()));
                Navigator.pushNamed(context, '/quarta');
              },
            ),
          FlatButton(
              color: Colors.green[200], 
              child: Text("Para a Listagem"),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => QuartaRota()));
                Navigator.pushNamed(context, '/todos');
              },
            ),
          FlatButton(
              color: Colors.green[200], 
              child: Text("Dados de Retorno"),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => QuartaRota()));
                Navigator.pushNamed(context, '/retorno');
              },
            ),
        ],
      ),
    );
  }
  
}

class SegundaRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
    Container(
      color:Colors.white,
      child: Container(
      color: Colors.lime,
      margin: const EdgeInsets.only(top: 200),
      child:Column(
        children: <Widget>[
          Text("Estou na tela 2",style: TextStyle(fontSize: 32),),
          FlatButton(
            color: Colors.amber, 
            child: Text("Voltar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ) 
        ],
      )
    )
    );
    
    
  }
}

class TerceiraRota extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 100),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Estou na tela 3",style: TextStyle(fontSize: 24)),
          Text("Para o alto e",style: TextStyle(fontSize: 24)),
          Text("AVANTE!!!",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
          FlatButton(
            color: Colors.amber, 
            child: Text("Voltar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            color: Colors.amber, 
            child: Text("Para a tela 4"),
            onPressed: () {
              Navigator.pushNamed(context, '/quarta');
            },
          ) 
 
        ],
      )
    );
  }
}

class QuartaRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 100),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("--- Tela 4 ---", style: TextStyle(color: Colors.lime, fontWeight: FontWeight.bold, fontFamily: "Arial", fontSize: 24),),
          FlatButton(
            color: Colors.amber, 
            child: Text("Voltar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ) 
        ],
      )
    );
  }
}