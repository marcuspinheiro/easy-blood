
class User{

  String name;
  String email;
  String bloodType;
  String cpf;
  String sex;
  String phone;
  bool elegibleDonor;
  String city;




User (String name, String email, String bloodType, String cpf, String sex, String phone, bool elegibleDonor, String city){

  this.name = name;
  this.email = email;
  this.bloodType = bloodType;
  this.cpf = cpf;
  this.sex = sex;
  this.phone = phone;
  this.elegibleDonor = elegibleDonor;
  this.city = city;

}

}




class Adress  {

String street;
String state;
String number;
String lat;
String long;

Adress (String state){
  this.state = state;
}

}