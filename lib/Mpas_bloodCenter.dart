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
                     child: CenterMap(
                       centros : snapshot.data,
                       initialPosition : const LatLng(-22.8269535, -47.0663047),
                     ),
                     
                     /*GoogleMap(
                       initialCameraPosition: CameraPosition(
                          target: LatLng(-22.8269535, -47.0663047),
                          zoom:12
                       ),
                       
                      
              
                     )*/


                     
  /*                    CenterMap(
                       documents : snapshot.data,
                       initialPosition : const LatLang(377.7786, -122.4375),
*/
                     
                     
                     ),
                   
                     Flexible(
                       flex: 3,
                       child:  CenterList (centro: snapshot.data)
                             /*ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index){
                                 //final center = centerCollector[index];
                                return ListTile(
                                  title: Text(snapshot.data[index].name),
                                  subtitle: Text(snapshot.data[index].name),

                               );
                                },
                                  )*/
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




class CenterList extends StatelessWidget{
  const CenterList ({
  Key key,
    @required this.centro,
  }) :super (key : key);

  final List <HemoCentro> centro;
  
  
    Widget build(BuildContext context) {
     return ListView.builder(
                    itemCount: centro.length,
                    itemBuilder: (BuildContext context, int index){
                      //final center = centerCollector[index];
                      return ListTile(
                        title: Text(centro[index].name),
                        subtitle: Text(centro[index].name),
  
                      );
                    },
                  );
  }
  }
  
class CenterMap extends StatelessWidget{

const CenterMap({
  Key key,
  @required this.centros,
  @required this.initialPosition,
}) : super(key:key);

final List<HemoCentro> centros;
final LatLng initialPosition;


Widget build (BuildContext context){
  return GoogleMap(
    initialCameraPosition: CameraPosition(
      target: initialPosition,
      zoom: 12
    ),

    markers: centros
      .map((centro) => Marker(
        markerId: MarkerId(centro.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed,),
        position: LatLng(
          -22.8269535, -47.0663047
        ),
        infoWindow: InfoWindow(
          title: 'titulo',
          snippet: 'teste',
        ),
      ))
      .toSet(),
  );
}

}