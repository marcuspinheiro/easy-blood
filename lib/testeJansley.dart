import 'package:flutter/material.dart';
import 'login_front.dart';

class Perguntas extends StatefulWidget {
  @override
  _PerguntasState createState() => _PerguntasState();
}

class _PerguntasState extends State<Perguntas> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Perguntas e Respostas")),
      body: Center(child: new Text("Tela única")),
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
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
                Navigator.pop(context);
              },
            ),
        ]),
      ),
    );
  }

}