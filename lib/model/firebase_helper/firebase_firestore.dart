

// ignore_for_file: avoid_print, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/order_model.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/model/usermodel.dart';
import '../categaryModel.dart';
import 'package:flutter/material.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").get();

      List<CategoryModel> categoriesList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data())) 
          .toList();

      return categoriesList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

    Future<List<CategoryModel>> getNewCollections() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("newCollections").get();

      List<CategoryModel> categoryModelList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data())) 
          .toList();

      return categoryModelList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

   Future<List<ProductModel>> getfeaturedProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collectionGroup("products").get();

      List<ProductModel> productModelList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data())) 
          .toList();

      return productModelList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

   Future<List<ProductModel>> getCategoryProducts(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").doc(id).collection("products").get();

      List<ProductModel> productModelList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data())) 
          .toList();

      return productModelList;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<UserModel> getUserInformation() async {
     DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

     
      return UserModel.fromJson(querySnapshot.data()!);      
  }





Future<UserModel?> getUserData(String userId) async {
  try {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(userId).get();

    if (documentSnapshot.exists) {
      return UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    } else {
      print("User data does not exist");
      return null;
    }
  } catch (e) {
    print("Error retrieving user data: $e");
    return null;
  }
}



  Future<bool> uploadOrderedProductFirebase(
    List<ProductModel> list,BuildContext context,String payment)async{
    try{
      showLoaderDialog(context);
      double totalprice = 0.0;
      for(var element in list){
        totalprice += element.price * element.count!;
      }
    DocumentReference  documentReference =  _firebaseFirestore
      .collection("Userorders")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("orders")
      .doc();
     
     DocumentReference  admin = _firebaseFirestore
      .collection("orders")
      .doc(documentReference.id);

      String uid = FirebaseAuth.instance.currentUser!.uid;

      admin.set({
        "products": list.map((e) => e.toJson()),
        "status": "pending",
        "totalprice":totalprice,
        "payment":payment,
        "userId":uid,
        "orderId": admin.id
      });

      documentReference.set({
        "products": list.map((e) => e.toJson()),
        "status": "pending",
        "totalprice":totalprice,
        "payment":payment,
        "userId":uid,
        "orderId": documentReference.id
      });
      Navigator.of(context,rootNavigator: true).pop();
      ShowMessage("Ordered Succesfully");
      
      return true;
    }catch(e){
      
      Navigator.of(context,rootNavigator: true).pop();
      ShowMessage(e.toString());
     
      return false;
    }
  }


  ///GET ORDER USER///

 Future<List<OrderModel>> getUserOrder() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firebaseFirestore
            .collection("Userorders")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("orders")
            .get();
    
    print("QuerySnapshot Length: ${querySnapshot.size}");

    List<OrderModel> orderList = querySnapshot.docs
        .map((element) => OrderModel.fromJson(element.data()))
        .toList();

    print("Order List Length: ${orderList.length}");
    
    return orderList;
  } catch (e) {
    print("Error in getUserOrder: $e");
    ShowMessage(e.toString());
    return [];
  }
}

 void updateTokenFromFirebase()async{
  String? token = await FirebaseMessaging.instance.getToken();
  if(token != null){
    _firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid)
    .update(
      {
       "notificationToken":token,
      }
  );
   
  }
 }


 Future<void>updateOrder(OrderModel orderModel,String status)async{

    await _firebaseFirestore
      .collection("Userorders")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("orders")
      .doc(orderModel.orderId)
      .update({
        "status":status,
      });
     
    await _firebaseFirestore
      .collection("orders")
      .doc(orderModel.orderId)
      .update({
        "status":status,
      });
  
  }

}