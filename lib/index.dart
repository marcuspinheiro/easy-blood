import 'package:flutter/material.dart';
import 'login_front.dart';

class Index extends StatefulWidget {
  @override
  IndexState createState() => IndexState();
}

class IndexState extends State<Index> {
  
  getLogin (){
    
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context)  {
                  return LoginFront();
              } ));
  }
  
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("EasyBlood")),
      body: Center(child: new Text("Tela única")),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Easy Blood'),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                // Ação para mudar para tela 1
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context)  {
                  return LoginFront();
              } ));
              },
            ),
            ListTile(
              title: Text('Criar usuário'),
              onTap: () {
                // Ação para mudar para tela 2
               Navigator.of(context).pushNamed('/CadastroUsuario');
              },
            ),
             ListTile(
              title: Text('Regras Doação'),
              onTap: () {
                // Ação para mudar para tela 2
               Navigator.of(context).pushNamed('/regra_doacao');
              },
            ),
            ListTile(
              title: Text('Sobre'),
              onTap: () {
                // Ação para mudar para tela 2
                
              },
              ),
             ListTile(
              title: Text('Mapa Centro Coletores'),
              onTap: () {
                // Ação para mudar para tela 2
               Navigator.of(context).pushNamed('/mapblood');
              },
            ),
        ]),
      ),
    );
  }



  /*
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new RaisedButton(
          child: new Text("Ir para login"),
          onPressed: getLogin,
        ),
      ),
    );
  }*/
}


