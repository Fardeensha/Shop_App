// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

CategoryModel CategoryModelFromJson(String str) =>
 CategoryModel.fromJson(json.decode(str));

String CategoryModelToJson(CategoryModel data) =>
 json.encode(data.toJson());

class CategoryModel{
  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
  });
String image;
String name;
String id;
 
 factory CategoryModel.fromJson(Map<String, dynamic> json)=> CategoryModel(
  image: json["image"],
  name: json["name"],
  id: json["id"],
  );

 Map<String,dynamic> toJson() => {
  "image":image, 
  "name": name,
  "id" : id,
 } ;
 
}