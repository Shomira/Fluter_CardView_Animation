import 'package:flutter/material.dart';
import 'package:practicalistviewflutter/main.dart';
import 'package:practicalistviewflutter/screens/home_screen.dart';


class Splash extends StatefulWidget{
  const Splash({Key? Key }): super(key: Key);

  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash>{
  @override
  void initState(){
    super.initState();
    super.initState();
    _navigatetoHome();
  }
  _navigatetoHome () async{
    await Future.delayed(Duration(milliseconds: 3000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash.png", width: 250, height: 250 ),
            Container(
              child: const Text(
                  'POPCORN',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30)
              ),
            )
          ],
        ),
      ),
    );
  }
}