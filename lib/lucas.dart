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
            body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
                ListTile(
                title: Text('Horse'),
                subtitle: Text('A strong animal'),
               dense: true,
              )
          ],
        ),
      ),
     
    );
  }
}