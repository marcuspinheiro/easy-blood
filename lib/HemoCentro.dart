import 'dart:collection';

class  HemoCentro {

String name;
String street;
String urlImage;
String city;
double lat;
double long;
String rule;

Map<String, double> blood = Map();

void updtaeHemoCentro(String rule){

  this.rule = rule;

}


HemoCentro(String name, String urlImage, double lat, double long, String street, String city){

  this.name = name;
  this.urlImage = urlImage;
  this.lat = lat;
  this.long = long;
  this.street = street;
  this.city = city;

  startMap();

}



 void startMap(){
  blood["O+"] = 0.0;
  blood["O-"] = 0.0;
  blood["AB-"] = 0.0;
  blood["AB+"] = 0.0;
  blood["A-"] = 0.0;
  blood["A+"] = 0.0;
  blood["B+"] = 0.0;
  blood["B-"] = 0.0;
}


void updateMap(String type, double value){

  blood[type] = value;

}



}

