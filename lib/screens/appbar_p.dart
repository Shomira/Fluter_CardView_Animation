import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements 
PreferredSizeWidget{
  final String tittle;
  final Color = Colors.deepPurple;
   const CustomAppBar ( {required this.tittle}): super() ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // llega de tipo object, entonces transformamos a Stringfinal  url = (ModalRoute.of(context)?.settings.arguments).toString();
    return  AppBar(
      title: Text(tittle),
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

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);


}
