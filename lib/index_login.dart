import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'index.dart';
import 'login_front.dart';
import 'class_user.dart';

class IndexLogin extends StatefulWidget {
  final User user;

  const IndexLogin({Key key, this.user}) : super(key: key);


  @override
  IndexLoginState createState() => IndexLoginState(user);
}

class IndexLoginState extends State<IndexLogin> {
  
  final User user;

  IndexLoginState(this.user);

  
  
  getLogin (){
    
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginFront()));
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
              child: Text('Olá, '+user.name),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text("Sair"),
              onTap: () {
                // Ação para mudar para tela 1
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Index()));
              },
            ),
            ListTile(
              title: Text('Tela 2'),
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