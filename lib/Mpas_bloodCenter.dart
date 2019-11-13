import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';



import 'HemoCentro.dart';

class MapBloodCenter extends StatefulWidget {
  @override
  _MapBloodCenterState createState() => _MapBloodCenterState();
}

class _MapBloodCenterState extends State<MapBloodCenter> {


Future<List<HemoCentro>> _getBloddCenter() async {

    var data = await http.get("https://easybloodteste.herokuapp.com/public/bloodcenter");
    
    var jsonData = json.decode(data.body);

    List<HemoCentro> hemoCentros = [];

    for (var i in jsonData){
      HemoCentro hemoCentro = HemoCentro(i["name"]);

      hemoCentros.add(hemoCentro);
      
      print(hemoCentro.name);

    }
    print ("Quantidade de Hemocentros");
    print(hemoCentros.length);
    return hemoCentros;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Cadastro Usuário"),
      ),
            body: FutureBuilder(
              future: _getBloddCenter(),
              builder: (BuildContext contex, AsyncSnapshot snapshot){

                if (snapshot.hasError){
                  return Center(child: Text('Error:${snapshot.error}'));
                }
                if (!snapshot.hasData){
                  return Center(child: Text('Loading...'));
                }

      
               return Column(
                 children: [
                   Flexible(
                     flex: 2,
                     child: GoogleMap(
                       initialCameraPosition: CameraPosition(
                          target: LatLng(-22.8269535, -47.0663047),
                          zoom:12
                       ),
                       
              
                     )


                     
  /*                    CenterMap(
                       documents : snapshot.data,
                       initialPosition : const LatLang(377.7786, -122.4375),
*/
                     
                     
                     ),
                   
                     Flexible(
                       flex: 3,
                       child: 
                             ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index){
                                 //final center = centerCollector[index];
                                return ListTile(
                                  title: Text(snapshot.data[index].name),
                                  subtitle: Text(snapshot.data[index].name),

                               );
                                },
                                  )
                     )
                     ],
            );
                   
              }
               )
               );
 
}
}


/*
return
                     ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    //final center = centerCollector[index];
                    return ListTile(
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].name),

                    );
                  },
                );*/



/*

class CenterList extends StatelessWidget{
  const CenterList ({
  Key key,
    @required this.documents,
  }) :super (key : key);

  final List <AsyncSnapshot> documents;
  
  
    Widget build(BuildContext context) {
     return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (BuildContext context, int index){
                      //final center = centerCollector[index];
                      final document = documents[index];
                      return ListTile(
                        title: Text(document.data.name),
                        subtitle: Text(document.data.name),
  
                      );
                    },
                  );
  }
  }
  
*/