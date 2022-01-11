import 'package:flutter/material.dart';
import 'package:practicalistviewflutter/screens/appbar_p.dart';

class DetailPage extends StatelessWidget {
  const DetailPage ({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // llega de tipo object, entonces transformamos a String
    final  url = (ModalRoute.of(context)?.settings.arguments).toString();
    return Scaffold(
        appBar: CustomAppBar(tittle: 'Detalle Imagenes',
        ),
        body: Hero(
        tag: url ,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Card(

                          child: FadeInImage(
                            image: NetworkImage(url),
                            placeholder: AssetImage("assets/images/glow.gif"),
                            height: 300,

                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text("Título Imagen", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 24)),
                        Text("Descripció Imagen", style: TextStyle( color: Colors.grey, fontSize: 12)),
                      ]
                  )
                ]
            )
        )
    );
  }

}
