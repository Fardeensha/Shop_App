// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';
// import 'package:shop_app/model/product_model.dart';

// import '../model/cartmodel.dart';
// import '../model/usermodel.dart';

// class ProductProvider with ChangeNotifier {
//   List<items> feature = [];
//   late items featureData;

//   List<CartModel> checkOutModelList = [];
//   late CartModel checkOutModel;
//   List<UserModel> userModelList = [];
//   late UserModel userModel;
//  Future<void> getUserData() async {
//   List<UserModel> newList = [];
//   User? currentUser = FirebaseAuth.instance.currentUser;
//  QuerySnapshot userSnapShot = await FirebaseFirestore.instance.collection("User").get();
// userSnapShot.docs.forEach((element) {
//   final dynamic data = element.data();
//   if (currentUser!.uid == data?["UserId"]) {
//     try {
//       userModel = UserModel(
//         userAddress: data?["UserAddress"] as String? ?? "",
//         userImage: data?["UserImage"] as String? ?? "",
//         userEmail: data?["UserEmail"] as String? ?? "",
//         userGender: data?["UserGender"] as String? ?? "",
//         userName: data?["UserName"] as String? ?? "",
//         userPhoneNumber: data?["UserNumber"] as String? ?? "",
//       );
//       newList.add(userModel);
//     } catch (e) {
//       print("Error parsing user data: $e");
//     }
//   }
// });

//   userModelList = newList;
// }


//   List<UserModel> get getUserModelList {
//     return userModelList;
//   }

//   void deleteCheckoutProduct(int index) {
//     checkOutModelList.removeAt(index);
//     notifyListeners();
//   }

//   void clearCheckoutProduct() {
//     checkOutModelList.clear();
//     notifyListeners();
//   }

//   void getCheckOutData({
//     required int quentity,
//     required double price,
//     required String name,
//     required String color,
//     required String size,
//     required String image,
//   }) {
//     checkOutModel = CartModel(
//       color: color,
//       size: size,
//       price: price,
//       name: name,
//       image: image,
//       quentity: quentity,
//     );
//     checkOutModelList.add(checkOutModel);
//   }

//   List<CartModel> get getCheckOutModelList {
//     return List.from(checkOutModelList);
//   }

//   int get getCheckOutModelListLength {
//     return checkOutModelList.length;
//   }

//  Future<void> getFeatureData() async {
//   List<items> newList = [];
//   QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
//       .collection("products")
//       .doc("")
//       .collection("featureproduct")
//       .get();
//   featureSnapShot.docs.forEach(
//     (element) {
//       final data = element.data() as Map<String, dynamic>?;

//       if (data != null) {
//         featureData = items(
//           image: data["image"] as String? ?? "",
//           name: data["name"] as String? ?? "",
//           price: (data["price"] as num?)?.toDouble() ?? 0.0,
//         );
//         newList.add(featureData);
//       }
//     },
//   );
//   feature = newList;
// }



//   List<items> get getFeatureList {
//     return feature;
//   }

//   List<items> homeFeature = [];

//  Future<void> getHomeFeatureData() async {
//   List<items> newList = [];
//   QuerySnapshot featureSnapShot =
//       await FirebaseFirestore.instance.collection("homefeature").get();
//   featureSnapShot.docs.forEach(
//     (element) {
//       final data = element.data() as Map<String, dynamic>?;

//       if (data != null) {
//         featureData = items(
//           image: data["image"] as String? ?? "", 
//           name: data["name"] as String? ?? "",   
//           price: (data["price"] as double?)?? 0.0,
//         );

//         // Check for null values and add to the list if not null
//         if (featureData.image.isNotEmpty && featureData.name.isNotEmpty) {
//           newList.add(featureData);
//         }
//       }
//     },
//   );
//   homeFeature = newList;
//   notifyListeners();
// }


//   List<items> get getHomeFeatureList {
//     return homeFeature;
//   }

//   List<items> homeAchive = [];

//   Future<void> getHomeAchiveData() async {
//     List<items> newList = [];
//   QuerySnapshot featureSnapShot =
//       await FirebaseFirestore.instance.collection("homeAchieve").get();
//   featureSnapShot.docs.forEach(
//     (element) {
//       final data = element.data() as Map<String, dynamic>?;

//       if (data != null) {
//         featureData = items(
//           image: data["image"] as String? ?? "", 
//           name: data["name"] as String? ?? "",   
//           price: (data["price"] as double?)?? 0.0,
//         );

//         // Check for null values and add to the list if not null
//         if (featureData.image.isNotEmpty && featureData.name.isNotEmpty) {
//           newList.add(featureData);
//         }
//       }
//     },
//   );
//   homeAchive = newList;
//   notifyListeners();
// }

//   List<items> get getHomeAchiveList {
//     return homeAchive;
//   }

//   List<items> newAchives = [];
//   late items newAchivesData;
//   Future<void> getNewAchiveData() async {
//     List<items> newList = [];
//     QuerySnapshot achivesSnapShot = await FirebaseFirestore.instance
//         .collection("products")
//         .doc("")
//         .collection("newachives")
//         .get();
//     achivesSnapShot.docs.forEach(
//       (element) {
//          final data = element.data() as Map<String, dynamic>?;
//           if (data != null) {
//         newAchivesData = items(
//            image: data["image"] as String? ?? "",
//           name: data["name"] as String? ?? "",
//           price: (data["price"] as num?)?.toDouble() ?? 0.0,
//         );
//         newList.add(newAchivesData);
//       }
//     }
      
//     );
//     newAchives = newList;
//     notifyListeners();
//   }


//   List<items> get getNewAchiesList {
//     return newAchives;
//   }

//   List<String> notificationList = [];

//   void addNotification(String notification) {
//     notificationList.add(notification);
//   }

//   int get getNotificationIndex {
//     return notificationList.length;
//   }
  
//   get getNotificationList {
//     return notificationList;
//   }

//   late List<items> searchList;
//   void getSearchList(
//     {required List<items> list}) {
//     searchList = list;
//   }

//   List<items> searchProductList(String query) {
//     List<items> searchShirt = searchList.where((element) {
//       return element.name.toUpperCase().contains(query) ||
//           element.name.toLowerCase().contains(query);
//     }).toList();
//     return searchShirt;
//   }
// }