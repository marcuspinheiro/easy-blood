import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';




import 'HemoCentro.dart';
import 'class_user.dart';

class MapBloodCenterLocation extends StatefulWidget {

  final User user;

  const MapBloodCenterLocation({Key key, this.user}) : super(key: key);

  @override
  _MapBloodCenterLocationState createState() => _MapBloodCenterLocationState(user);
}

class _MapBloodCenterLocationState extends State<MapBloodCenterLocation> {

    final User user;

  _MapBloodCenterLocationState(this.user);


final Completer<GoogleMapController> _mapController = Completer();


Future<List<HemoCentro>> _getBloddCenter() async {

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
      print(lat);
      print(long);

      HemoCentro hemoCentro = HemoCentro(i["name"], i["imageURL"], lat, long, street, city);

      if (user.city == city){
        hemoCentros.add(hemoCentro);
      }

      
      
      print(hemoCentro.name);
      print(hemoCentro.urlImage);
      print(hemoCentro.street);
      print(hemoCentro.city);
    }
    print ("Quantidade de Hemocentros");
    print(hemoCentros.length);
    return hemoCentros;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Centro Coletores em: " + user.city), // cidade de busca de centro coletor
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
                       initialPosition : const LatLng(-22.8340737, -47.0548373),
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
                        subtitle: Text(centro[index].street  + ', ' + centro[index].city), //localização do centro coletor
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
                                  centro[index].lat, centro[index].long
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
          centro.lat, centro.long
        ),
        infoWindow: InfoWindow(
          title: centro.name, // titulo do marcador
          snippet: centro.street, //Subtitulo do marcador 
        ),
      ))
      .toSet(),
      onMapCreated: (mapController){
        this.mapController.complete(mapController);
      },
  );
}

}