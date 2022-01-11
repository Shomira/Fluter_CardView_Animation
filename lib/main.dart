import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:practicalistviewflutter/providers/provider_product.dart';
import 'package:practicalistviewflutter/screens/animaciones_screen.dart';
import 'package:practicalistviewflutter/screens/appbar_p.dart';
import 'package:practicalistviewflutter/screens/detail_image.dart';
import 'package:practicalistviewflutter/screens/animation_container.dart';
import 'package:practicalistviewflutter/screens/home_screen.dart';
import 'package:practicalistviewflutter/screens/list_Image.dart';
import 'package:practicalistviewflutter/screens/producto.dart';
import 'package:practicalistviewflutter/splash.dart';

void main() {
  runApp( const MyApp());
}
int _counter = 0;
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets Basicos',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Splash(),
      routes: <String, WidgetBuilder>{
        "second" : (_) => HomeScreen(),
        "/inicio" : (BuildContext context) => MyApp(),
        "/generos" : (BuildContext context) => ListadoProductos(titulo: 'Listado de Generos'),
        "/productos":(BuildContext context) => MyHomePage(title: "Productos"),
        "/animaciones":(BuildContext context) => Animaciones(title: "Animaciones Flutter"),
        "/listImagenes":(BuildContext context) => ListImage(),
        // uso del Hero Animation
        "/detalleImagenes":(BuildContext context) => DetailPage(),
        // AnimationContainer
        "/animacionContenedor":(BuildContext context) => AnimationC(),


      },
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          tittle: 'Listado de peliculas',
        ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context,data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items =data.data as List<ProductDataModel>;
              return ListView.builder(
                  itemCount: items == null? 0: items.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 50,
                              child: Image(image: NetworkImage(items[index].imageURL.toString()),fit: BoxFit.fill,),
                            ),
                            Expanded(child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: const EdgeInsets.only(left: 20,right: 8),child: Text(items[index].name.toString(),style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                  Padding(padding: const EdgeInsets.only(left: 20,right: 8),child: Text(items[index].price.toString()),)
                                ],
                              ))
                             ),
                            IconButton(
                              icon: const Icon(
                                Icons.navigate_next_rounded,
                                color: Colors.deepPurple,
                                size: 20.0,
                              ),
                              tooltip: 'Más Información...',
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Mas información del producto')));
                              },
                            ),
                          ],
                        ),
                      )

                    );
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        )
    );
  }

  Future<List<ProductDataModel>>ReadJsonData() async{
    final jsondata = await rootBundle.loadString('data/product.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}