import 'package:flutter/material.dart';
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
                        SizedBox(height: 24.0),
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
                          'O aplicativo para doadores de sangue',
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
                               Navigator.of(context).pushNamed('/mapblood');
                              },
                              backgroundColor: Colors.red,
                              child: Icon(Icons.map),
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
<<<<<<< HEAD
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
                             ListTile(
                               title:itemRow('Login'),
                              onTap:() {
                            // Ação para mudar para tela 2
                          Navigator.of(context).pushNamed('/login');
                          },) 
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
                             ListTile(
                               title:itemRow('Sobre'),
                              onTap:() {
                            // Ação para mudar para tela 2
                          Navigator.of(context).pushNamed('/sobreSistema');
                          },)

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
=======
             ListTile(
              title: Text('Regras Doação'),
              onTap: () {
                // Ação para mudar para tela 2
               Navigator.of(context).pushNamed('/regra_doacao');
              },
            ),
            ListTile(
              title: Text('Sobre'),
              onTap: () {
                // Ação para mudar para tela 2
                
              },
            ),
        ]),
      ),
    );
>>>>>>> perguntas-respostas
  }

}





 itemRow(name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,      
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 6.0),
            Text(
              name,
              style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 42.0),
            )
          ],
        ),
      ],
    );
  }

/*
 Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 42.0),

                                  ),


 */