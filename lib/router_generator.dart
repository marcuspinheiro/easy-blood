import 'package:flutter/material.dart';
import 'Mpas_bloodCenter.dart';
import 'home_map.dart';
import 'index.dart';
import 'list.dart';
import 'lucas.dart';
import 'index_login.dart';
import 'perguntasRespostas.dart';
import 'regras_doacao.dart';


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
      case '/listTileExample':
        return MaterialPageRoute(builder: (_) =>ListTileExample());
      case '/cadastro_user':
        return MaterialPageRoute(builder: (_) => CadstroUser());
      case '/home_maps':
        return MaterialPageRoute(builder: (_) => HomeMaps());
      case '/regra_doacao':
        return MaterialPageRoute(builder: (_) => RegraDoacao());
      case '/perguntas_respostas':
        return MaterialPageRoute(builder: (_) => Perguntas());
      case '/mapblood':
        return MaterialPageRoute(builder: (_) => MapBloodCenter());
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
        
        