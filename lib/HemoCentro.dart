class  HemoCentro {

String name;
String street;
String urlImage;
String city;
double lat;
double long;
var blood;



HemoCentro(String name, String urlImage, double lat, double long, String street, String city){

  this.name = name;
  this.urlImage = urlImage;
  this.lat = lat;
  this.long = long;
  this.street = street;
  this.city = city;


}


void setNull(){

  this.name = null;


}




}

