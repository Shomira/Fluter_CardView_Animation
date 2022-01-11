import 'package:flutter/material.dart';
import 'package:practicalistviewflutter/screens/appbar_p.dart';

class AnimationC extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: CustomAppBar(
          tittle: 'Hero y Fade Animation',
        ),
        body: const AnimacionContenedor(),

    );
  }

}
class AnimacionContenedor extends StatefulWidget {
  const AnimacionContenedor({Key? key}) : super(key: key);

  @override
  State<AnimacionContenedor> createState() => _AnimacionContenedor();
}

class _AnimacionContenedor extends State<AnimacionContenedor> {
  bool selected = false;
  bool first = false;
  final es = SizedBox(height: 6);
  late AnimationController contrContenedor;
  @override
  Widget build(BuildContext context) {
    // GestureDetector responde a la accion de resionar el Contenedor
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          first = !first;
        });
      },
      child: Column(
          children:  <Widget>[
            Text(" Animation Container - Animation Cross Fade", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 18)),
             es,
             Row(

                 children:  <Widget>[
                   Column(children:  <Widget>[
                     RichText(
                       text: TextSpan(
                         text: selected ? "True - Animación(fastOutSlowIn)": "False- No Animado(fastOutSlowIn)",
                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)
                       ),
                     ),
                     es,
                     AnimatedContainer(
                       // true - false
                       width: selected ? 80.0 : 100.0,
                       height: selected ? 100.0 : 150.0,
                       color: selected ? Colors.green: Colors.lightGreenAccent,
                       alignment:
                       selected ? Alignment.center : AlignmentDirectional.topCenter,
                       duration: const Duration(seconds: 5),
                       curve: Curves.fastOutSlowIn,
                       child: CircleAvatar(
                         backgroundColor: Colors.black,
                       ),
                     ),
                   ]),
                 es,
                  Column( children: [
                    RichText(
                      text: TextSpan(
                        text: selected ? "True - Animación(elasticIn)": " False- No Animado(elasticIn)",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)

                      ),
                    ),
                    es,
                    AnimatedContainer(
                      // true - false
                      width: selected ? 80.0 : 100.0,
                      height: selected ? 60.0 : 100.0,
                      color: selected ? Colors.orange : Colors.redAccent,
                      alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
                      duration: const Duration(seconds: 5),
                      curve: Curves.elasticIn,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,

                      ),
                    ),
                  ],

                  )
             ]),
            es,
            Column(children:  <Widget>[
              es,
              RichText(text: TextSpan(
                    text: selected ? "True - Animación(decelerate)": " False- No Animado(decelerate)",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)
                ),
              ),
              es,
              AnimatedContainer(
                width: selected ? 80.0 : 100.0,
                height: selected ? 60.0 : 100.0,
                color: selected ? Colors.orange : Colors.redAccent,
                alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 5),
                curve: Curves.decelerate,
                child: CircleAvatar(
                  backgroundColor: Colors.black,

                ),
              ),
              es,
              Text("AnimatedCrossFade", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 24)),
              AnimatedCrossFade(
                duration: const Duration(seconds: 3),
                //      firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
                // secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 250.0),
                firstChild: Contendor1(),
                secondChild: Contendor2(),
                crossFadeState:  first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              )
            ])

          ]
      ),

    );
  }
}


class Contendor1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15)),

      ),
      width: 80,
      height: 80,

    );
  }

}
class Contendor2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15)),
      ),
      width: 40,
      height: 40,
    );
  }

}
