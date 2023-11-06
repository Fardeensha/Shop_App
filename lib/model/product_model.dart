import 'dart:convert';

ProductModel productModelFromJson(String str) =>
 ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) =>
 json.encode(data.toJson());

class ProductModel{
  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isFavorite,
    this.count
  });
String image;
String id;
bool isFavorite;
String name;
double price;
String description;

int? count;
 
 factory ProductModel.fromJson(Map<String, dynamic> json)=> ProductModel(
  id: json["id"],
  name: json["name"],
  price: double.parse(json["price"].toString()),
  description: json["description"],
  image: json["image"],
  isFavorite: false,
  count : json["count"]
  );

 Map<String,dynamic> toJson() => {
  "id": id,
  "name": name,
  "price": price,
  "description": description,
  "image":image,
  "isFavorite": isFavorite,
  "count" : count
 } ;

ProductModel copyWith({
int? count,
  }) =>
  ProductModel(
  id: id,
  name: name,
  price: price,
  description: description,
  image: image,
  isFavorite: isFavorite,
  count : count??this.count,
  
      );

}