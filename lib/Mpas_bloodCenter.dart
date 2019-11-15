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

final Completer<GoogleMapController> _mapController = Completer();


Future<List<HemoCentro>> _getBloddCenter() async {

    var data = await http.get("https://easybloodteste.herokuapp.com/public/bloodcenter");
    
    var jsonData = json.decode(data.body);

    List<HemoCentro> hemoCentros = [];

    for (var i in jsonData){
      HemoCentro hemoCentro = HemoCentro(i["name"], i["imageURL"]);

      hemoCentros.add(hemoCentro);
      
      print(hemoCentro.name);
      print(hemoCentro.urlImage);
    }
    print ("Quantidade de Hemocentros");
    print(hemoCentros.length);
    return hemoCentros;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Centro Coletores"),
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

               return Stack(
                 children: <Widget> [ 
                    CenterMap(
                       centros : snapshot.data,
                       initialPosition : const LatLng(-22.8269535, -47.0663047),
                       mapController: _mapController,
                     ),
                   
                   
                     CenterList (
                         centro: snapshot.data,
                         mapController: _mapController 
                       )
                  
                     ,]  
            );
              }
               )
               );
 
}
}


class CenterList extends StatelessWidget{
  const CenterList ({
  Key key,
    @required this.centro,
    @required this.mapController,
  }) :super (key : key);

  final List <HemoCentro> centro;
  final Completer<GoogleMapController> mapController;
  
  
    Widget build(BuildContext context) {
     return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: centro.length,
            itemBuilder: (BuildContext context, int index){
              return SizedBox(
                width: 340,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Card(
                    child: Center(
                      child: ListTile(
                        title: Text(centro[index].name),
                        subtitle: Text(centro[index].name),
                        leading: Container(
                          child: ClipRRect(
                            child: Image.network(centro[index].urlImage, fit: BoxFit.cover,),
                                   borderRadius: const BorderRadius.all(Radius.circular(2)),
                          ),
                          width: 60,
                          height: 60,
                        ),
                        onTap: () async{
                          final controller =  await mapController.future;
                          await controller.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                  -22.8269535, -47.0663047
                                ),
                                zoom: 16
                              )
                            )
                            );
                        },
                      ) ,
                    ),
                  )
                ),
              );
            },
          ),
        ),
      ),
     );
  }
  }
  
class CenterMap extends StatelessWidget{

const CenterMap({
  Key key,
  @required this.centros,
  @required this.initialPosition,
  @required this.mapController,
}) : super(key:key);

final List<HemoCentro> centros;
final LatLng initialPosition;
final Completer<GoogleMapController> mapController;

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
      onMapCreated: (mapController){
        this.mapController.complete(mapController);
      },
  );
}

}