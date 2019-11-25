import 'package:flutter/material.dart';
import 'package:fluttergooglemapsapp/router_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GoogleMaps Demo',
      theme: ThemeData(
        primaryColor: Colors.red
      ),
<<<<<<< HEAD
      initialRoute: '/perguntas_respostas',//rota de de inicio '/' == Index() 
=======
      initialRoute: '/splashScreen',//rota de de inicio '/' == Index() 
>>>>>>> splash-screen
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

