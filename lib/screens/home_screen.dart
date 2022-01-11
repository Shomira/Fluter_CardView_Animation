import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    //Botones
    final button1 = ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black54,
          elevation: 5,
          shadowColor: Colors.black
      ),
      icon: const Icon(
        Icons.movie,
        size: 20,
        color: Colors.black54,
      ),
      label: Text('Películas'),
      onPressed: (){
        Navigator.pushNamed(context, "/generos");
      },
    );
    final button2 = ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          primary: Colors.black54,
          onPrimary: Colors.white,
          elevation: 5,
          shadowColor: Colors.black
      ),
      icon: const Icon(
        Icons.production_quantity_limits,
        size: 20,
        color: Colors.white,
      ),
      label: Text('Productos'),
      onPressed: (){
        Navigator.pushNamed(context, "/productos");
      },
    );
    final button3 = ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black54,
          elevation: 5,
          shadowColor: Colors.black
      ),
      icon: const Icon(
        Icons.animation,
        size: 20,
        color: Colors.black54,
      ),
      label: Text('Animaciones'),
      onPressed: (){
        Navigator.pushNamed(context, "/animaciones");
      },
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
                size: 20.0,
              ),
              tooltip: 'Información del perfil',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Muestra el perfil de usuario')));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.person_pin_circle_rounded,
                color: Colors.white,
                size: 20.0,
              ),
              tooltip: 'Información del perfil',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Muestra la ubicación')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),
          ],
        ),
        body: Column(
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
                      button3,
                    ]
                  ),
                  Column(
                      children:  <Widget>[
                        button1,
                        button2,
                        button3,
                      ]
                  )
                ],
              ),


        ]
        )
    );
  }
}