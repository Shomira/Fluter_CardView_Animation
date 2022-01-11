

import 'package:flutter/material.dart';
import 'package:practicalistviewflutter/screens/appbar_p.dart';



class ListImage extends StatelessWidget {
  const ListImage({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: CustomAppBar(tittle: 'Hero y Fade Animation'),
      body: GridView.builder(

          itemCount: 20,

          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0),
            itemBuilder: (context, index){
            final urlDetail = "https://picsum.photos/id/$index/400/300";
            final url = "https://picsum.photos/id/$index/400/400";

            return InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/detalleImagenes", arguments: urlDetail);
              },
              child: Hero(
                  tag: urlDetail ,
                    child: Card(
                      elevation: 7,
                      child: FadeInImage(
                        image: NetworkImage(url),
                        placeholder: AssetImage("assets/images/glow.gif"),
                        height: 400,
                      ),

                    ),

              )
            );
          }
      )
    );
  }

}