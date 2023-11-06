



import 'package:shop_app/model/product_model.dart';



class OrderModel{
  OrderModel({
    required this.orderId,
    required this.payment,
    required this.status,
    required this.totalprice,
     required this.products,
     required this.userId
  });
String payment;
String status;
List<ProductModel> products;
double totalprice;
String orderId;
String userId;
 
 factory OrderModel.fromJson(Map<String, dynamic> json) {
  List<dynamic> productMap = json["products"];
  return OrderModel(
  payment: json["payment"],
  status: json["status"],
  orderId: json["orderId"],
  userId: json["userId"],
  totalprice: json["totalprice"],  
  products: productMap.map((e) => ProductModel.fromJson(e)).toList(),
  );
 }
}