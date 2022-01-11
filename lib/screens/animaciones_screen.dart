import 'package:flutter/material.dart';
import 'package:practicalistviewflutter/screens/appbar_p.dart';

class Animaciones extends StatefulWidget {
 Animaciones({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  AnimacionesState createState() => AnimacionesState();

}
class AnimacionesState extends State<Animaciones> {
  @override
  Widget build(BuildContext context) {
    //Botones
    final button1 = ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          primary: Colors.amber,
          onPrimary: Colors.black54,
          elevation: 5,
          shadowColor: Colors.black
      ),
      icon: const Icon(
        Icons.list,
        size: 20,
        color: Colors.black54,
      ),
      label: Text('Hero Animation'),
      onPressed: (){
        Navigator.pushNamed(context, "/listImagenes");
      },
    );
    final button2 = ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black54,
          elevation: 5,
          shadowColor: Colors.black
      ),
      icon: const Icon(
        Icons.crop_square_sharp,
        size: 20,
        color: Colors.black54,
      ),
      label: Text('Animacion Cont'),
      onPressed: (){
        Navigator.pushNamed(context, "/animacionContenedor");
      },
    );
    return Scaffold(
        appBar: CustomAppBar(
          tittle: 'Animaciones de Fluter',
        ),
        body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: const <Widget>[
              /** Widget  Image**/
              Image(
                width: 300.0,
                height: 300.0,
                image: NetworkImage('https://c.tenor.com/4i_vCC1wVw4AAAAC/homer-simpson-woohoo.gif'),
              ),
              Text('POPCORN', style: TextStyle(fontSize: 20, color: Colors.black45, fontWeight: FontWeight.bold)),

            ],
          ),
          SizedBox(height: 6.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                  children:  <Widget>[
                    button1,
                    button2,

                  ]
              ),
              ]


          ),


        ]
    )
    );
  }


}