import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Easy Blood',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: 11.0)),
                SizedBox(height: 20.0),
                Container(
                  width: 200.0,
                  child: Text(
                    'Olá, ' + user.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 48.0),
                  ),
                ),
                SizedBox(height: 42.0),
                ListTile (
                  title: itemRow(Icons.map, 'Mapa Centro Coletor', '',Colors.white),  
                  onTap: () {
                      // Ação para mudar para tela 2
                    Navigator.of(context).pushNamed('/mapblood');
                    },),//marcus
                ListTile (
                  title: itemRow(Icons.location_on, 'Mapa por Localidade', '',Colors.white),  
                  onTap: () {
                      // Ação para mudar para tela 2
                    Navigator.of(context).pushNamed('/mapbloodlocation', arguments: user);
                    },),
                 ListTile (
                  title: itemRow(Icons.invert_colors, 'Mapa por tipo de Sangue', '',Colors.white),  
                  onTap: () {
                      // Ação para mudar para tela 2
                    Navigator.of(context).pushNamed('/mapbloodtype', arguments: user);
                    },),//marcus
                ListTile (
                  title: itemRow(Icons.help, 'Dúvidas e Respostas', '', Colors.white),  
                  onTap: () {
                        // Ação para mudar para tela 2
                      Navigator.of(context).pushNamed('/regra_doacao');
                        },),
                ListTile (
                  title:itemRow(Icons.info, 'Sobre','', Colors.white),
                  onTap: () {
                            // Ação para mudar para tela 2
                          Navigator.of(context).pushNamed('/regra_doacao');
                          },),
              ],
            ),
          ),
          SizedBox(height: 32.0),

          SizedBox(height: 32.0),

          Spacer(),
          Container(
            height: 80.0,
            child: ListTile (
                  title:itemRow(Icons.input, 'Sair','', Colors.white),
                  onTap: () {
                            // Ação para mudar para tela 2
                          Navigator.of(context).pushNamed('/');
                          },),
          )
        ],
      ),
    );
  }

}


  itemRow(icon, name, title, textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              icon,
              color: textColor,
            ),
            SizedBox(width: 6.0),
            Text(
              name,
              style: TextStyle(color: textColor, fontSize: 20.0),
            )
          ],
        ),
        Text(title, style: TextStyle(color: textColor, fontSize: 20.0))
      ],
    );
  }

