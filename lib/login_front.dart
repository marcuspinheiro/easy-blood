import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class LoginFront extends StatefulWidget {
  @override
  _LoginFrontState createState() => _LoginFrontState();
}

class _LoginFrontState extends State<LoginFront> {
 
 bool _isLoading = false;
  TextEditingController _usernameController = new TextEditingController();
 TextEditingController _userpassordController = new TextEditingController();


  getLogin() async{

    print("========================TESTE LOGIN ==========================");

    String username = _usernameController.text;
    String password = _userpassordController.text;
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
       return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Usuário'
              ),
              controller: _usernameController,
            ),
             TextField(
              decoration: InputDecoration(
                hintText: 'Senha'
              ),
              controller: _userpassordController,
            ),
            Container(height: 20,),
            _isLoading ? CircularProgressIndicator() : SizedBox(
              height: 40,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: getLogin, 
                /*() async {
                  setState(() {
                    _isLoading = true;
                  });
                  //final users = await ApiService.getUserList();
                  setState(() {
                    _isLoading = false;
                  });
                  /*if (users == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text("Check your internet connection"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      }
                    );
                    return;
                  } else {
                    final userWithUsernameExists = users.any((u) => u['username'] == _usernameController.text);
                    if (userWithUsernameExists) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Posts()
                        )
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Incorrect username'),
                            content: Text('Try with a different username'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        }
                      );
                    }
                  }*/
                }*/
              ),
            )
          ],
        ),
      ),
    );
  }
}