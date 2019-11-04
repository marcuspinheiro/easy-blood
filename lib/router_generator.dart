import 'package:flutter/material.dart';
import 'index.dart';
import 'login_front.dart';
import 'lucas.dart';
import 'main.dart';
import 'index_login.dart';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => Index());
      case '/index_login':
        return MaterialPageRoute(
          builder: (_) => IndexLogin(
            user: args,
          )
        );
      case '/cadastro_usuario':
        return MaterialPageRoute(builder: (_) => CadstroUser());
      default:
        return _errorRoute();
                    }
                  }
                
        
       static Route<dynamic> _errorRoute(){
         return MaterialPageRoute(builder: (_){
           return Scaffold(
             appBar: AppBar(
               title: Text("ERROR"),
             ),
             body: Center(
               child: Text("ERROR"),
             ),
           );
         }      
         );
       }
}
        
        