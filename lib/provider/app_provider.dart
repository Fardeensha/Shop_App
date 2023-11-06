// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/model/firebase_helper/firebase_firestore.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/model/usermodel.dart';

import '../model/firebase_helper/firebase_storage.dart';

class AppProvider with ChangeNotifier{
  //Cart Products
final  List<ProductModel> _cartProductList = [];
final  List<ProductModel> _buyProductList = [];
 
 UserModel? _userModel;
 UserModel get getUserInformation=> _userModel!;

  void addCartProduct(ProductModel productModel){
    _cartProductList.add(productModel);
    notifyListeners();
  }

   void removeCartProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get  getCartProductList => _cartProductList;

//Favorite Products

final  List<ProductModel> _favoriteProductList = [];

  void addFavoriteProduct(ProductModel productModel){
    _favoriteProductList.add(productModel);
    notifyListeners();
  }

   void removeFavoriteProduct(ProductModel productModel){
    _favoriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get  getfavoriteProductList => _favoriteProductList;


//User Information

void getUserInfoFirebase() async{
_userModel = await  FirebaseFirestoreHelper.instance.getUserInformation();
notifyListeners();
}

void updateUserinfoFirebase(BuildContext context, UserModel userModel,File? file)async{
 
  if(file==null){
     showLoaderDialog(context);
    _userModel = userModel;
  await  FirebaseFirestore.instance
    .collection("users")
    .doc(_userModel!.id)
    .set(_userModel!.toJson());
    Navigator.of(context,rootNavigator: true).pop();
     Navigator.of(context).pop();
  }else{
     showLoaderDialog(context);
   String imageUrl = await FirebaseStorageHelper.instance.uploadUserImage(file);
   _userModel = userModel.copyWith(image: imageUrl);
   await  FirebaseFirestore.instance
    .collection("users")
    .doc(_userModel!.id)
    .set(_userModel!.toJson());
  
    Navigator.of(context,rootNavigator: true).pop();
    Navigator.of(context).pop();
  }
   ShowMessage("Succesfull Updated");
   notifyListeners(); 
}

void updatePasswordinfoFirebase(BuildContext context, UserModel userModel,)async{
    _userModel = userModel;
  await  FirebaseFirestore.instance
    .collection("users")
    .doc(_userModel!.id)
    .set(_userModel!.toJson());
   notifyListeners(); 
}

/////TOTAL PRICE///////
    double totalPrice(){
      double totalPrice = 0.0;
      for (var element in _cartProductList){
        totalPrice += element.price * element.count!;
      }
      return totalPrice;
    }

    double totalPriceBuyProductList(){
      double totalPrice = 0.0;
      for (var element in _buyProductList){
        totalPrice += element.price * element.count!;
      }
      return totalPrice;
    }

    void updateCount(ProductModel productModel, int count){
      int index = _cartProductList.indexOf(productModel);
      _cartProductList[index].count = count;
      notifyListeners();
    }

    /////BUY PRODUCT//// 
   void addBuyProduct(ProductModel model){
    _buyProductList.add(model);
    notifyListeners();
   }

    void addBuyProductCartList(){
    _buyProductList.addAll(_cartProductList);
    notifyListeners();
   }

     void clearCart(){
    _cartProductList.clear();
    notifyListeners();
   }

    void clearBuyProduct(){
    _buyProductList.clear();
    notifyListeners();
   }
   
    List<ProductModel> get getBuyProductList => _buyProductList;
}