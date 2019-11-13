import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';



class RegraDoacao extends StatefulWidget {
  @override
  _RegraDoacaoState createState() => _RegraDoacaoState();
}

class _RegraDoacaoState extends State<RegraDoacao> {


  Future<List<Regras>> _getRegras() async {

    var data = await http.get("http://www.json-generator.com/api/json/get/bUGkouscbS?indent=2");
    
    var jsonData = json.decode(data.body);

    List<Regras> regras = [];

    for (var i in jsonData){
      Regras regra = Regras(i["rule"]);

      regras.add(regra);
    }


    print(regras.length);

    return regras;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Regras para doação de Sangue"),
      ),
            body: Container(
              child: FutureBuilder(
                future: _getRegras(),
                builder: (BuildContext contex, AsyncSnapshot snapshot){
                  
                      if (snapshot.data == null){

                        return Container(
                          child: Center(
                            child: Text("Loading...")
                          )
                        );
                      }else {
                        return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index){
                          return ListTile(
                          title: (Text(snapshot.data[index].rule)),
                        );
                      },
                    ); 
                      
                    }
                },
                  
                
              )
            )
     
    );
  }
}

class Regras{

  String rule;

  Regras(String rule){
    this.rule = rule;
  }
}