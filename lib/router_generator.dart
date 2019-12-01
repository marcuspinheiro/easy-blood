import 'package:flutter/material.dart';
import 'package:fluttergooglemapsapp/perguntasRespostas.dart';
import 'package:fluttergooglemapsapp/sobreSistema.dart';
import 'package:fluttergooglemapsapp/splashScreen.dart';
import 'package:fluttergooglemapsapp/pages/home_screen.dart';
import 'package:fluttergooglemapsapp/widgets/walkthrough.dart';
import 'MapBloodCenterLocation.dart';
import 'Mapas_bloodCenter.dart';
import 'MpaBloodCenterTipoSangue.dart';
import 'home_map.dart';
import 'index.dart';
import 'list.dart';
import 'login_front.dart';
import 'lucas.dart';
import 'index_login.dart';
import 'regras_doacao.dart';
import 'register_user.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Index());
      case '/index_login':
        return MaterialPageRoute(
            builder: (_) => IndexLogin(
                  user: args,
                ));
      case '/CadastroUsuario':
        return MaterialPageRoute(builder: (_) => CadastroUsuario());
      case '/listTileExample':
        return MaterialPageRoute(builder: (_) => ListTileExample());
      case '/cadastro_user':
        return MaterialPageRoute(builder: (_) => CadstroUser());
      case '/home_maps':
        return MaterialPageRoute(builder: (_) => HomeMaps());
      case '/regra_doacao':
        return MaterialPageRoute(builder: (_) => RegraDoacao());
      case '/sobreSistema':
        return MaterialPageRoute(builder: (_) => SobreSistema());
      case '/perguntas_respostas':
        return MaterialPageRoute(builder: (_) => Perguntas());
      case '/mapblood':
        return MaterialPageRoute(builder: (_) => MapBloodCenter());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginFront());
      case '/mapbloodlocation':
        return MaterialPageRoute(builder: (_) => MapBloodCenterLocation(user: args,));
      case '/mapbloodtype':
        return MaterialPageRoute(builder: (_) => MapBloodCenterTipoSangue(user: args,));
      case '/home_page':
        return MaterialPageRoute(builder: (_) => HomeScreen(pageRoute: null, walkthroughList: <Walkthrough>[
          Walkthrough(
                  title: "TESTE 1",
                  content: "CONTENT 1",
                  imageIcon: Icons.mobile_screen_share,
                ),
                Walkthrough(
                  title: "TESTE 2",
                  content: "CONTENT 2",
                  imageIcon: Icons.search,
                ),
                Walkthrough(
                  title: "TESTE 3",
                  content: "CONTENT 3",
                  imageIcon: Icons.shopping_cart,
                ),
                Walkthrough(
                  title: "TESTE 4",
                  content: "CONTENT 4",
                  imageIcon: Icons.verified_user,
                ),],));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
