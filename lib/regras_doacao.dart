import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'HemoCentro.dart';



class RegraDoacao extends StatefulWidget {
  @override
  _RegraDoacaoState createState() => _RegraDoacaoState();
}

class _RegraDoacaoState extends State<RegraDoacao> {


  Future<List<HemoCentro>> _getRegras() async {

   var data = await http.get("https://easybloodteste.herokuapp.com/public/bloodcenter");
    
    var jsonData = json.decode(data.body);

    print(data.body);

    List<HemoCentro> hemoCentros = [];

    for (var i in jsonData){

      var adress = i['address'];

      double lat = adress['latitude'];
      double long = adress['longitude'];
      String street = adress["street"];
      String city = adress["city"];


      HemoCentro hemoCentro = HemoCentro(i["name"], i["imageURL"], lat, long, street, city);

      hemoCentro.updtaeHemoCentro( i["requirements"]);

      if (hemoCentro.rule.length > 0 && hemoCentro.rule != null){
        
        print("regras de doação: " + hemoCentro.rule);
        hemoCentros.add(hemoCentro);
        print("INSEIRU");
      
      }
      
      
      

    }
    print ("Quantidade de Hemocentros");
    print(hemoCentros.length);
    return hemoCentros;
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
                  
                      if (!snapshot.hasData){

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
                          title: (Text(snapshot.data[index].name)),
                          subtitle: (Text(snapshot.data[index].rule)),
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