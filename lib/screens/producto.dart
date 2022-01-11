import 'package:flutter/material.dart';

import 'appbar_p.dart';
class FichaProducto extends StatelessWidget{
  final String name;
  final String description;
  final int price;
  final String imagen;
  final Color color;
  final Color colorText;

  const FichaProducto(
      {required this.name, required this.description, required this.price,
        required this.imagen, required this.color, required this.colorText}
      ):super();

  @override
  Widget build(BuildContext context){
    //final ButtonStyle style =
    //ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Card(

        child: Container(
          decoration: BoxDecoration(
            color: this.color,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            )

          ),
          height: 150,
          child: Row(
            children: <Widget>[
              Image.asset("assets/images/"+this.imagen, width: 100, height: 100 ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Text(this.name, style: TextStyle(fontWeight: FontWeight.bold, color: this.colorText)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                        child: Text(this.description, style: TextStyle(color: this.colorText)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text("Precio: "+this.price.toString(), style: TextStyle(color: this.colorText))
                    )

                  ],

                ),
              )

            ],
          ),
        )
    );
  }
}
class ListadoProductos extends StatelessWidget{
  final String titulo;
  const ListadoProductos({required this.titulo}):super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
        tittle: 'Listado Pgeneros',
      ),

      body: ListView(
        children: const <Widget>[
          FichaProducto(name: 'Misterio', description: 'Son distinguidas por la estructura de su argumento' , price: 1500, imagen: 'misterio.png', color: Colors.black54, colorText: Colors.white),
          FichaProducto(name: 'Drama', description: 'Buscan una respuesta emotiva en el público', price: 1500, imagen: 'teatro.png' , color: Colors.white70, colorText: Colors.black),
          FichaProducto(name: 'Aventuras', description: 'Refleja un mundo heroico de combates y aventuras', price: 1500, imagen: 'aventuras.png',color: Colors.black54,colorText: Colors.white),
          FichaProducto(name: 'Películas del oeste', description: '  Se ambienta en el viejo Oeste estadounidense', price: 100, imagen: 'occidental.png', color: Colors.white60 , colorText: Colors.black),
          FichaProducto(name: 'Fantasía', description: 'Contiene algún elemento de fantasía, por tenue que sea', price: 1500, imagen: 'fantasia.png', color: Colors.black54, colorText: Colors.white),
          FichaProducto(name: 'Historia', description: 'Ambientación en una época histórica determinada', price: 1500, imagen: 'historicas.png', color: Colors.white60, colorText: Colors.black),
          FichaProducto(name: 'Artes marciales', description: '  Trama contiene escenas de lucha acrobática, llamada arte marcial', price: 1500,imagen: 'artes_marciales.png', color: Colors.black54,colorText: Colors.white)
        ],
      ),
    );
  }

}