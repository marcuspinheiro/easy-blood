import 'package:flutter/material.dart';

import 'Mapas_bloodCenter.dart';


class Index2 extends StatefulWidget {
  @override
  Index2State createState() => Index2State();
}

class Index2State extends State<Index2> {
  
 Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                  Expanded(
            flex: 1,//tamanho da borda branca
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(108.0)),// a ondulação da borda
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),//o alinhamneto do texto
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8.0),
                        Icon(Icons.arrow_back),
                        SizedBox(height: 8.0),
                        Container(
                          width: 300.0,
                          child: Text(
                            'EasyBlood',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32.0, color: Colors.red),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'O aplicativo que te levar a doação',
                          style: TextStyle(color: Colors.black45),
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[

                            SizedBox(width: 4.0),
                            Text('Bem Vindo',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 52.0)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Spacer(
                          flex: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsScreen()));//MapBloodCenter()));
                              },
                              backgroundColor: Colors.red,
                              child: Icon(Icons.invert_colors),
                            ),
             
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0)
                  ],
                ),
              ),
            ),
          ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),// espaçamento entre as caixas
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width / 2 - 50,// tamanho das caixas
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 42.0),
                                  ),
                                  SizedBox(width: 8.0),
                             
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                        Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width / 2 - 50,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Sobre',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 42.0),
                                  ),
                                  SizedBox(width: 8.0),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }



}

class DetailsScreen extends StatelessWidget {
  @override
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
                        letterSpacing: 1.1,
                        fontSize: 22.0)),
                SizedBox(height: 32.0),
                Container(
                  width: 200.0,
                  child: Text(
                    'Olá User',
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
                    Navigator.of(context).pushNamed('/mapblood');
                    },),
                 ListTile (
                  title: itemRow(Icons.invert_colors, 'Mapa por tipo de Sangue', '',Colors.white),  
                  onTap: () {
                      // Ação para mudar para tela 2
                    Navigator.of(context).pushNamed('/mapblood');
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
}



