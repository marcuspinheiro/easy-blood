import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
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