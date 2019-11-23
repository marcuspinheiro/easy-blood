import 'package:flutter/material.dart';
import 'Mapas_bloodCenter.dart';
import 'home_map.dart';
import 'index.dart';
import 'list.dart';
import 'login_front.dart';
import 'lucas.dart';
import 'index_login.dart';
import 'regras_doacao.dart';
import 'register_user.dart';


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
      case '/CadastroUsuario':
        return MaterialPageRoute(builder: (_) => CadastroUsuario());
      case '/listTileExample':
        return MaterialPageRoute(builder: (_) =>ListTileExample());
      case '/cadastro_user':
        return MaterialPageRoute(builder: (_) => CadstroUser());
      case '/home_maps':
        return MaterialPageRoute(builder: (_) => HomeMaps());
      case '/regra_doacao':
        return MaterialPageRoute(builder: (_) => RegraDoacao());
      case '/mapblood':
        return MaterialPageRoute(builder: (_) => MapBloodCenter());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginFront());
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
        
        