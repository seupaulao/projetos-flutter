import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Lago alguma coisa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text('Algum Lugar', style: TextStyle(color: Colors.grey[500]),)
              ]
            ),
          ),
          FavoritoWidget(),
        ],
      ),
    );


    Color color = Theme.of(context).primaryColor;  

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _construirButtonColor(color, Icons.call, 'CALL'),
          _construirButtonColor(color, Icons.near_me, 'ROUTE'),
          _construirButtonColor(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      )
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover
              ),
            titleSection,
            buttonSection,
            textSection
          ],
        )
      ),
    );
  }

Column _construirButtonColor(Color cor, IconData icone, String rotulo){
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icone, color: cor),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          rotulo,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: cor
          ),
        ),
      ),
    ],
  );
}

}

class FavoritoWidget extends StatefulWidget{
  @override
  _FavoritoWidgetState createState() => _FavoritoWidgetState();
}

class _FavoritoWidgetState extends State<FavoritoWidget> {

bool _isFavorito = true;
int _contadorFavorito = 41;

  void _toggleFavorito() {
    setState(() {
    if (_isFavorito) {
      _contadorFavorito -= 1;
      _isFavorito = false;
    } else {
      _contadorFavorito += 1;
      _isFavorito = true;
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
          Container(
             padding: EdgeInsets.all(0),
             child: IconButton(
               icon: (_isFavorito ? Icon(Icons.star) : Icon(Icons.star_border)),
               color: Colors.red[500],
               onPressed: _toggleFavorito,
             ),
          ),
          SizedBox(
            width: 18,
            child: Text('$_contadorFavorito'),
          )
      ],
    );
  }


}


