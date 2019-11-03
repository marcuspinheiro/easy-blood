import 'package:google_maps_flutter/google_maps_flutter.dart';

class  HemoCentro {

String nome;
double longitude;
double latitude;
String url;
String id;




HemoCentro(String nome, double longitude, double latitude, String url, String id){

  this.nome = nome;
  this.longitude = longitude;
  this.latitude = latitude;
  this.url = url;
  this.id = id;

}


void setNull(){

  this.nome = null;
  this.longitude = null;
  this.latitude = null;
  this.url = null;
  this.id = null;

}




}

