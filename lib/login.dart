import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  
  getLogin () async{
    String username = "teste";
    String password = "123";
 String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  print(basicAuth);

  http.Response r = await http.post('https://easybloodteste.herokuapp.com/users/login',
      headers: <String, String>{'authorization': basicAuth});
 
  print(r.statusCode);
  print(r.body);

if (r.statusCode == 200){
  print("Login Feito com sucesso");
}else{
  print("Login INVALIDO");
}


  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new RaisedButton(
          child: new Text("login"),
          onPressed: getLogin,
        ),
      ),
    );
  }
}