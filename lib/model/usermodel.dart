

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

UserModel UserModelFromJson(String str) =>
 UserModel.fromJson(json.decode(str));

String UserModelToJson(UserModel data) =>
 json.encode(data.toJson());

class UserModel{
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
     this.image,
  });
String email;
String password;
String name;
String id;
String? image;
 
 factory UserModel.fromJson(Map<String, dynamic> json)=> UserModel(
  email: json["email"],
  password: json["password"],
  name: json["name"],
  id: json["id"],
  image: json["image"]
  );

 Map<String,dynamic> toJson() => {
  "email":email, 
  "password": password,
  "name": name,
  "id" : id,
  "image":image,
 } ;

 
UserModel copyWith({
String? name,image,password
  }) =>
  UserModel(
  id: id,
  name: name?? this.name,
  email: email,
  image: image??this.image,
  password: password??this.password,
 
  
      );
 
}