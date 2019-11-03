import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'login_front.dart';

class IndexLogin extends StatefulWidget {
  final String user;

  const IndexLogin({Key key, this.user}) : super(key: key);


  @override
  IndexLoginState createState() => IndexLoginState(user);
}

class IndexLoginState extends State<IndexLogin> {
  
  final String user;

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
              MaterialPageRoute(builder: (context) => LoginFront()));
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