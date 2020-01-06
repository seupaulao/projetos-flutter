
import 'package:flutter/material.dart';

/*
pesquisar palavra/texto : buscar na biblia palavras ou textos
   - resultado 
         antigo testamento  - quantitativo
         novo   testamento  - quantitativo
         - habilitar função compartilhar resultado
         Ao clicar no resultado
               listar livro  - quantitativo
               listar livro  - quantitativo
               - habilitar função compartilhar resultado
         Ao clicar no livro      
                - exibir versos do livro afetado pela busca
                - destacar a busca em negrito
                - habilitar função compartilhar

*/
class TelaPesquisar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pesquisar Palavra ou Texto"),
        ),
        body: _componentePesquisar(context),
      ),
    );
  }
}

Widget _componentePesquisar(BuildContext context)
{
  return Column(
    children: <Widget>[
      RaisedButton(
        child: Text("Voltar"),
          onPressed: () {
            Navigator.pop(context);
        },
      )
    ],
  );
}