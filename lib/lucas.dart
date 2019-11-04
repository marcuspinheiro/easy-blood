import 'package:flutter/material.dart';

class CadstroUser extends StatefulWidget {
  @override
  _CadstroUserState createState() => _CadstroUserState();
}

class _CadstroUserState extends State<CadstroUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Cadastro Usuário"),
      ),
      
    );
  }
}