import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';




import 'HemoCentro.dart';
import 'class_user.dart';

class MapBloodCenterTipoSangue extends StatefulWidget {


  final User user;
  const MapBloodCenterTipoSangue({Key key, this.user}) : super(key: key);
  
  @override
  _MapBloodCenterTipoSangueState createState() => _MapBloodCenterTipoSangueState(user);
}

class _MapBloodCenterTipoSangueState extends State<MapBloodCenterTipoSangue> {

  final User user;

  _MapBloodCenterTipoSangueState(this.user);


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
      double liter;
      String typeblood;

      HemoCentro hemoCentro = HemoCentro(i["name"], i["imageURL"], lat, long, street, city);

  if (i['bloodList'] != null){
    
     for (var j in i['bloodList']){

       liter = j['liters'];
       typeblood = j['type'];
       hemoCentro.updateMap(typeblood, liter);

        print(typeblood + ':' + liter.toString());

      }
      
  }
        hemoCentros.add(hemoCentro);

      

      
      print("=========================================================================================================");
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
        title: new Text("Tipo de Sangue: " + user.bloodType,)//tipo de sangue da busca
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
                       bloodTypeUser: user.bloodType

                     ),
                   
                   
                     CenterList (
                         centro: snapshot.data,
                         mapController: _mapController,
                         bloodTypeUser: user.bloodType
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
    @required this.bloodTypeUser,
  }) :super (key : key);

  final List <HemoCentro> centro;
  final Completer<GoogleMapController> mapController;
  final String bloodTypeUser;
  
  
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
                        subtitle: Text("Litros de " +  bloodTypeUser + ": " + centro[index].blood[bloodTypeUser].toString()), //Quantidade de Sangue do tipo do usuário
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
  @required this.bloodTypeUser,
}) : super(key:key);

final List<HemoCentro> centros;
final LatLng initialPosition;
final Completer<GoogleMapController> mapController;
final String bloodTypeUser;

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
          snippet: "Litros de " +  bloodTypeUser + ": " + centro.blood[bloodTypeUser].toString(), //Subtitulo do marcador 
        ),
      ))
      .toSet(),
      onMapCreated: (mapController){
        this.mapController.complete(mapController);
      },
  );
}

}