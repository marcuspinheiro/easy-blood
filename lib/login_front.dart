import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'class_user.dart';



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

  var jsonData = json.decode(r.body);
  var adress = jsonData['address'];

  //double lat = adress['latitude'];
  //double long = adress['longitude'];
  //String street = adress["street"];
  String city = adress["city"];



  User user = User(jsonData['name'], jsonData['email'], jsonData['bloodType'], jsonData['cpf'], jsonData['sex'], 
  jsonData['phone'], jsonData['elegibleDonor'], city);

  print('Nome do usuário: '+user.name);
  print('Cidade: ' + city);

  Navigator.of(context).pushNamed('/index_login', arguments: user);
}else{
  print("Login INVALIDO");
  _showError();
}

  }

  void _showError() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Erro"),
          content: new Text("Login Inválido!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Voltar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
              obscureText: true,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}