import 'package:flutter/material.dart';

/**
 * leitura e analise : realizar a leitura e ao clicar no verso a análise:
   1. referência cruzada
   2. referência strong do verso com análise gramatical e de possiveis significados
   3. analisar verso, buscar no dicionário
   4. contar quantidade de palavras no original grego
   5. contar quantidade de palavras na versão blv
 * 
 */

class TelaLeitura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
       padding: EdgeInsets.all(10),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Leitura e Análise"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
          ],
        ),
      )
    );

  }
}