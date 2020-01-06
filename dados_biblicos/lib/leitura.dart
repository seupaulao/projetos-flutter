import 'package:flutter/material.dart';

/**
 * leitura e analise :
 *  realizar a leitura e ao clicar no verso a análise:
   1. referência cruzada
   2. referência strong do verso com análise gramatical e de possiveis significados

    Serviços : nodejs/express ou flask - base mongodb
               arquivos json
 *
 */

class TelaLeitura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> entries = <String>['A', 'B', 'C'];
    //final List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
        appBar: AppBar(
          title: Text("Leitura e Análise"),
        ),
        body: Container(
              child:ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.amber,
                      child: Center(child: Text('Entry ${entries[index]}')),
                    );
                  }
              )
          )
        );
  }
}